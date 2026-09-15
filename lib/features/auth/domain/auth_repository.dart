import '../../../core/error/result.dart';
import '../data/models/user_model.dart';

/// Contrat du module Auth — la seule chose que `presentation/` connaît.
/// Une seule implémentation existe (contrairement à Patrimoine) :
/// [AuthRepositoryImpl], contre le backend Zira24 réel — l'authentification
/// existe déjà en production, pas de mock ici.
abstract class AuthRepository {
  /// POST /auth/login — `twoFactorCode` optionnel, requis seulement si le
  /// backend répond que le compte a la 2FA activée.
  Future<Result<UserModel>> login({
    required String email,
    required String password,
    required String tenantSlug,
    String? twoFactorCode,
  });

  /// POST /auth/logout, puis efface la session locale quel que soit le résultat serveur.
  Future<Result<void>> logout();

  /// GET /auth/me — profil de l'utilisateur actuellement connecté.
  Future<Result<UserModel>> getCurrentUser();

  /// Présence d'une session locale (token stocké), sans validation serveur.
  Future<bool> hasStoredSession();
}
