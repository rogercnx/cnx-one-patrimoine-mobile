// ignore_for_file: prefer_initializing_formals — paramètres nommés publics
// (dio/secureStorage) stockés dans des champs privés.
import 'package:dio/dio.dart';

import '../../../core/error/result.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../domain/auth_repository.dart';
import 'models/user_model.dart';

/// Implémentation réelle de [AuthRepository] contre `backend.zira24.com`.
///
/// Forme de `POST /auth/login` confirmée par appel réel (compte `dev-seeg`) :
/// `{ accessToken, refreshToken, sessionId, user: {...} }` — voir
/// `user_model.dart` pour le détail des champs de `user`. `sessionId` est
/// présent au même niveau que `accessToken`/`refreshToken` mais n'est
/// consommé par aucun appel actuel (`/auth/refresh` ne prend que
/// `refreshToken`, cf. `AuthInterceptor`) : volontairement ignoré ici plutôt
/// qu'étendre l'interface pour une donnée sans consommateur.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required Dio dio, required SecureStorageService secureStorage})
      : _dio = dio,
        _secureStorage = secureStorage;

  final Dio _dio;
  final SecureStorageService _secureStorage;

  @override
  Future<Result<UserModel>> login({
    required String email,
    required String password,
    required String tenantSlug,
    String? twoFactorCode,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/auth/login', data: {
        'email': email,
        'password': password,
        'tenantSlug': tenantSlug,
        if (twoFactorCode != null && twoFactorCode.isNotEmpty) 'twoFactorCode': twoFactorCode,
      });
      final session = _extractSession(response.data);
      if (session == null) {
        return const Failure(ServerException('Réponse de connexion inattendue du serveur.'));
      }
      await _secureStorage.saveSession(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken,
        tenantSlug: tenantSlug,
      );
      return Success(session.user);
    } on DioException catch (e) {
      if (_isTwoFactorRequired(e)) {
        return const Failure(TwoFactorRequiredException());
      }
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _dio.post<void>('/auth/logout');
    } on DioException {
      // On efface la session locale même si l'appel serveur échoue
      // (token déjà expiré, pas de réseau...) — l'utilisateur doit pouvoir
      // se déconnecter localement dans tous les cas.
    }
    await _secureStorage.clearSession();
    return const Success(null);
  }

  @override
  Future<Result<UserModel>> getCurrentUser() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/auth/me');
      final data = response.data;
      if (data == null) {
        return const Failure(ServerException('Profil utilisateur introuvable.'));
      }
      return Success(UserModel.fromJson(data));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<bool> hasStoredSession() async {
    final token = await _secureStorage.readAccessToken();
    return token != null;
  }

  /// Détecte la demande de 2FA à partir du code d'erreur machine (`error`),
  /// seul canal fiable confirmé par appel réel (cf. commentaire de classe).
  bool _isTwoFactorRequired(DioException e) {
    final data = e.response?.data;
    if (data is! Map) return false;
    final code = (data['error'] as String?)?.toUpperCase() ?? '';
    return code.contains('TWO_FACTOR') || code.contains('2FA');
  }

  _LoginSession? _extractSession(Map<String, dynamic>? data) {
    if (data == null) return null;
    final accessToken = data['accessToken'] as String?;
    final refreshToken = data['refreshToken'] as String?;
    final userJson = data['user'] as Map<String, dynamic>?;
    if (accessToken == null || refreshToken == null || userJson == null) return null;
    return _LoginSession(accessToken: accessToken, refreshToken: refreshToken, user: UserModel.fromJson(userJson));
  }
}

class _LoginSession {
  const _LoginSession({required this.accessToken, required this.refreshToken, required this.user});

  final String accessToken;
  final String refreshToken;
  final UserModel user;
}
