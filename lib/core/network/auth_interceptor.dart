// ignore_for_file: prefer_initializing_formals — les paramètres nommés publics
// (secureStorage/onSessionExpired) gardent une API d'appel lisible tout en
// stockant dans des champs privés.
import 'dart:async';

import 'package:dio/dio.dart';

import '../storage/secure_storage_service.dart';

/// Injecte le Bearer token sur chaque requête (sauf login/refresh) et gère
/// le refresh automatique sur 401 : tente `/auth/refresh`, rejoue la requête
/// originale si succès, sinon efface la session et notifie [onSessionExpired]
/// — c'est ce callback (câblé dans `auth_providers.dart` vers
/// `AuthController.forceSignOut`) qui met à jour l'état d'auth global,
/// plutôt que de laisser l'erreur remonter brute jusqu'à l'écran.
///
/// Découplé de Riverpod par construction (callback + `attachDio`) pour rester
/// testable sans `ProviderContainer`.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required SecureStorageService secureStorage,
    required Future<void> Function() onSessionExpired,
  })  : _secureStorage = secureStorage,
        _onSessionExpired = onSessionExpired;

  final SecureStorageService _secureStorage;
  final Future<void> Function() _onSessionExpired;

  /// Le Dio auquel cet intercepteur est attaché — utilisé pour l'appel de
  /// refresh et le replay, afin de bénéficier de la même config (baseUrl,
  /// timeouts). Fixé une fois, juste après la création du Dio dans
  /// `auth_providers.dart` (voir `ApiClient.create`).
  Dio? _dio;

  Completer<bool>? _refreshInFlight;

  static const _excludedPaths = ['/auth/login', '/auth/refresh'];

  void attachDio(Dio dio) => _dio = dio;

  bool _isExcluded(String path) => _excludedPaths.any(path.endsWith);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_isExcluded(options.path)) {
      handler.next(options);
      return;
    }
    _secureStorage.readAccessToken().then((token) {
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    });
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final path = err.requestOptions.path;
    final isUnauthorized = err.response?.statusCode == 401;

    if (!isUnauthorized || _isExcluded(path)) {
      handler.next(err);
      return;
    }

    _handleUnauthorized(err, handler);
  }

  Future<void> _handleUnauthorized(DioException err, ErrorInterceptorHandler handler) async {
    final refreshed = await _refreshSession();
    if (!refreshed) {
      await _secureStorage.clearSession();
      await _onSessionExpired();
      handler.next(err);
      return;
    }

    try {
      final response = await _dio!.fetch<dynamic>(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  /// Un seul refresh à la fois : si plusieurs requêtes échouent en 401
  /// simultanément, elles attendent toutes le même appel `/auth/refresh`
  /// au lieu d'en déclencher un chacune.
  Future<bool> _refreshSession() {
    final inFlight = _refreshInFlight;
    if (inFlight != null) return inFlight.future;

    final completer = Completer<bool>();
    _refreshInFlight = completer;
    _performRefresh().then(completer.complete).whenComplete(() => _refreshInFlight = null);
    return completer.future;
  }

  Future<bool> _performRefresh() async {
    final refreshToken = await _secureStorage.readRefreshToken();
    if (refreshToken == null) return false;

    try {
      final response = await _dio!.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      final data = response.data;
      if (data == null) return false;

      // NOTE : noms de champs à confirmer contre la vraie réponse de
      // /auth/refresh (l'OpenAPI du backend ne documente pas le corps de
      // succès). Convention JWT standard + cohérente avec le nom du champ
      // de la requête (`refreshToken`, confirmé). À ajuster ici si besoin
      // dès réception d'un exemple réel.
      final newAccessToken = data['accessToken'] as String?;
      final newRefreshToken = data['refreshToken'] as String?;
      if (newAccessToken == null) return false;

      await _secureStorage.saveAccessToken(newAccessToken);
      if (newRefreshToken != null) {
        await _secureStorage.saveRefreshToken(newRefreshToken);
      }
      return true;
    } on DioException {
      return false;
    }
  }
}
