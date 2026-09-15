import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_colors.dart';

/// Coquille commune aux 3 onglets (Accueil, Scanner, Historique) : bottom
/// navigation bar avec le bouton Scanner mis en avant, comme dans le design
/// de référence (`nav` du prototype).
class PatrimoineShell extends StatelessWidget {
  const PatrimoineShell({super.key, required this.child});

  final Widget child;

  static const _tabs = ['/accueil', '/scanner', '/historique'];

  int _indexPour(String location) {
    final i = _tabs.indexWhere((t) => location.startsWith(t));
    return i < 0 ? 0 : i;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _indexPour(location);

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
                _TabButton(icon: Icons.home_rounded, label: 'Accueil', selected: index == 0, onTap: () => context.go('/accueil')),
                _ScanButton(selected: index == 1, onTap: () => context.go('/scanner')),
                _TabButton(icon: Icons.history_rounded, label: 'Historique', selected: index == 2, onTap: () => context.go('/historique')),
              ],
            ),
          ),
        ),
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
