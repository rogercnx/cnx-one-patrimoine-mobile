import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Wrapper autour de `flutter_secure_storage` — seul point d'accès au
/// stockage sécurisé (Keychain/Keystore) pour le token d'accès, le refresh
/// token et le tenantSlug de l'organisation connectée.
/// Voir CLAUDE.md section 2.7 : c'est le seul mécanisme de persistance du
/// token, jamais `SharedPreferences`.
class SecureStorageService {
  const SecureStorageService([FlutterSecureStorage? storage]) : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _tenantSlugKey = 'tenant_slug';

  Future<String?> readAccessToken() => _storage.read(key: _accessTokenKey);

  Future<void> saveAccessToken(String token) => _storage.write(key: _accessTokenKey, value: token);

  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> saveRefreshToken(String token) => _storage.write(key: _refreshTokenKey, value: token);

  Future<String?> readTenantSlug() => _storage.read(key: _tenantSlugKey);

  Future<void> saveTenantSlug(String tenantSlug) => _storage.write(key: _tenantSlugKey, value: tenantSlug);

  /// Sauvegarde la session complète obtenue après un login réussi.
  Future<void> saveSession({required String accessToken, required String refreshToken, required String tenantSlug}) async {
    await Future.wait([
      saveAccessToken(accessToken),
      saveRefreshToken(refreshToken),
      saveTenantSlug(tenantSlug),
    ]);
  }

  /// Efface toute la session (logout, ou refresh échoué de façon définitive).
  Future<void> clearSession() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _tenantSlugKey),
    ]);
  }
}
