import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_breakpoints.dart';
import '../../../../theme/app_colors.dart';

/// Coquille commune aux 4 onglets (Accueil, Scanner, Historique, Profil).
///
/// Point de décision responsive local (CLAUDE.md — pas dans `main.dart`) :
/// - `< kTabletBreakpoint` : `BottomNavigationBar` inchangée (bouton Scanner
///   mis en avant, comme le design de référence).
/// - `>= kTabletBreakpoint` : `NavigationRail` à gauche, mêmes 4
///   destinations/icônes, le contenu occupe le reste de la largeur.
///
/// Le 4ème onglet (Profil) relève du module Auth, pas de Patrimoine — cette
/// coquille reste le point d'assemblage commun de la navigation applicative.
class PatrimoineShell extends StatelessWidget {
  const PatrimoineShell({super.key, required this.child});

  final Widget child;

  static const _tabs = ['/accueil', '/scanner', '/historique', '/profil'];

  int _indexPour(String location) {
    final i = _tabs.indexWhere((t) => location.startsWith(t));
    return i < 0 ? 0 : i;
  }

  void _aller(BuildContext context, int index) => context.go(_tabs[index]);

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _indexPour(location);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isTabletWidth(constraints.maxWidth)) {
          return _TabletShell(index: index, onSelect: (i) => _aller(context, i), child: child);
        }
        return _PhoneShell(index: index, onSelect: (i) => _aller(context, i), child: child);
      },
    );
  }
}

class _PhoneShell extends StatelessWidget {
  const _PhoneShell({required this.index, required this.onSelect, required this.child});

  final int index;
  final ValueChanged<int> onSelect;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.card,
          border: Border(top: BorderSide(color: AppColors.line)),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                _TabButton(icon: Icons.home_rounded, label: 'Accueil', selected: index == 0, onTap: () => onSelect(0)),
                _ScanButton(selected: index == 1, onTap: () => onSelect(1)),
                _TabButton(icon: Icons.history_rounded, label: 'Historique', selected: index == 2, onTap: () => onSelect(2)),
                _TabButton(icon: Icons.person_rounded, label: 'Profil', selected: index == 3, onTap: () => onSelect(3)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabletShell extends StatelessWidget {
  const _TabletShell({required this.index, required this.onSelect, required this.child});

  final int index;
  final ValueChanged<int> onSelect;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              selectedIndex: index,
              onDestinationSelected: onSelect,
              backgroundColor: AppColors.card,
              labelType: NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: AppColors.brand),
              selectedLabelTextStyle: const TextStyle(color: AppColors.brand, fontWeight: FontWeight.w800, fontSize: 11.5),
              unselectedIconTheme: const IconThemeData(color: AppColors.ink3),
              unselectedLabelTextStyle: const TextStyle(color: AppColors.ink3, fontWeight: FontWeight.w600, fontSize: 11.5),
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.home_rounded), label: Text('Accueil')),
                NavigationRailDestination(icon: Icon(Icons.qr_code_scanner_rounded), label: Text('Scanner')),
                NavigationRailDestination(icon: Icon(Icons.history_rounded), label: Text('Historique')),
                NavigationRailDestination(icon: Icon(Icons.person_rounded), label: Text('Profil')),
              ],
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1, color: AppColors.line),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({required this.icon, required this.label, required this.selected, required this.onTap});

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.brand : AppColors.ink3;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 21, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: selected ? FontWeight.w800 : FontWeight.w600, color: color)),
          ],
        ),
      ),
    );
  }
}

class _ScanButton extends StatelessWidget {
  const _ScanButton({required this.selected, required this.onTap});

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 54,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.brand : AppColors.ink,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.qr_code_scanner_rounded, size: 20, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text('Scanner', style: TextStyle(fontSize: 10, fontWeight: selected ? FontWeight.w800 : FontWeight.w600, color: selected ? AppColors.brand : AppColors.ink3)),
          ],
        ),
      ),
    );
  }
}
