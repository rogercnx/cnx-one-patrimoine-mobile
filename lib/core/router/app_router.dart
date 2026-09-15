import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/patrimoine/presentation/accueil/accueil_screen.dart';
import '../../features/patrimoine/presentation/fiche/fiche_detail_screen.dart';
import '../../features/patrimoine/presentation/historique/historique_screen.dart';
import '../../features/patrimoine/presentation/scanner/scanner_screen.dart';
import '../../features/patrimoine/presentation/shell/patrimoine_shell.dart';

/// Router racine : 3 onglets (Accueil, Scanner, Historique) sous une coquille
/// commune (bottom nav) + la Fiche détail en route plein écran, accessible
/// en `push` depuis n'importe lequel des 3 onglets.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/accueil',
    routes: [
      ShellRoute(
        builder: (context, state, child) => PatrimoineShell(child: child),
        routes: [
          GoRoute(path: '/accueil', builder: (context, state) => const AccueilScreen()),
          GoRoute(path: '/scanner', builder: (context, state) => const ScannerScreen()),
          GoRoute(path: '/historique', builder: (context, state) => const HistoriqueScreen()),
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
