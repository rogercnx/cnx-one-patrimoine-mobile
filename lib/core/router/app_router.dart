import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/profile_screen.dart';
import '../../features/patrimoine/presentation/accueil/accueil_screen.dart';
import '../../features/patrimoine/presentation/fiche/fiche_detail_screen.dart';
import '../../features/patrimoine/presentation/historique/historique_screen.dart';
import '../../features/patrimoine/presentation/scanner/scanner_screen.dart';
import '../../features/patrimoine/presentation/shell/patrimoine_shell.dart';

/// Router racine : `/login` par défaut, guard d'auth vers le shell Patrimoine
/// (3 onglets + Fiche détail en route plein écran) une fois connecté.
final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = _AuthRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      // Session initiale encore en cours de résolution (lecture du storage +
      // GET /auth/me) : on ne redirige pas tant qu'on ne sait pas.
      if (authState.isLoading) return null;

      final isLoggedIn = authState.valueOrNull != null;
      final goingToLogin = state.matchedLocation == '/login';

      if (!isLoggedIn && !goingToLogin) return '/login';
      if (isLoggedIn && goingToLogin) return '/accueil';
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      ShellRoute(
        builder: (context, state, child) => PatrimoineShell(child: child),
        routes: [
          GoRoute(path: '/accueil', builder: (context, state) => const AccueilScreen()),
          GoRoute(path: '/scanner', builder: (context, state) => const ScannerScreen()),
          GoRoute(path: '/historique', builder: (context, state) => const HistoriqueScreen()),
          GoRoute(path: '/profil', builder: (context, state) => const ProfileScreen()),
        ],
      ),
      GoRoute(
        path: '/fiche/:id',
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: FicheDetailScreen(immobilisationId: state.pathParameters['id']!),
        ),
      ),
    ],
  );
});

/// Pont entre `authControllerProvider` (Riverpod) et `GoRouter`, qui a besoin
/// d'un `Listenable` classique pour savoir quand ré-évaluer `redirect`.
class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    ref.listen(authControllerProvider, (previous, next) => notifyListeners());
  }
}
