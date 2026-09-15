import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/result.dart';
import '../data/models/user_model.dart';
import 'auth_providers.dart';

/// État de session global : `null` = déconnecté, [UserModel] = connecté.
/// `state.isLoading` couvre le "en cours" (démarrage de l'app ou login en
/// cours) ; `state.hasError` porte l'[AppException] d'un login échoué.
/// C'est ce provider que le guard de `go_router` observe pour rediriger
/// vers `/login` ou vers le shell principal (voir `core/router/app_router.dart`).
class AuthController extends AsyncNotifier<UserModel?> {
  @override
  Future<UserModel?> build() async {
    final repository = ref.watch(authRepositoryProvider);
    if (!await repository.hasStoredSession()) return null;

    final result = await repository.getCurrentUser();
    return switch (result) {
      Success(:final data) => data,
      Failure() => null, // token invalide/expiré : traité comme déconnecté, pas d'erreur bloquante au démarrage
    };
  }

  Future<void> login({
    required String email,
    required String password,
    required String tenantSlug,
    String? twoFactorCode,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.login(
      email: email,
      password: password,
      tenantSlug: tenantSlug,
      twoFactorCode: twoFactorCode,
    );
    switch (result) {
      case Success(:final data):
        state = AsyncData(data);
      case Failure(:final error):
        state = AsyncError(error, StackTrace.current);
    }
  }

  /// Recharge le profil depuis `GET /auth/me`. Utilisé uniquement en secours
  /// par l'écran Profil si jamais le profil n'était pas déjà en mémoire
  /// (normalement inatteignable : le guard du router n'affiche cet écran
  /// qu'une fois authentifié, donc `state.value` est déjà peuplé depuis le login).
  Future<void> refreshProfile() async {
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.getCurrentUser();
    switch (result) {
      case Success(:final data):
        state = AsyncData(data);
      case Failure(:final error):
        state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    state = const AsyncData(null);
  }

  /// Appelé par [AuthInterceptor] quand le refresh token est lui-même
  /// invalide/expiré — la session locale est déjà effacée à ce stade.
  Future<void> forceSignOut() async {
    state = const AsyncData(null);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, UserModel?>(AuthController.new);
