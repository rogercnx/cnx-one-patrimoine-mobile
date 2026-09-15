import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/result.dart';
import '../../../theme/app_colors.dart';
import '../data/models/user_model.dart';
import 'auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('COMPTE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.1, color: AppColors.ink4)),
            Text('Profil', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.6, color: AppColors.ink)),
          ],
        ),
      ),
      // `state.value` est déjà peuplé depuis le login (voir AuthController) —
      // aucun nouvel appel réseau ici dans le cas normal. Le bouton
      // "Réessayer" ci-dessous, lui, déclenche explicitement GET /auth/me.
      body: switch (authState) {
        AsyncValue(value: final UserModel user) => _ProfileContent(user: user),
        AsyncValue(isLoading: true) => const Center(child: CircularProgressIndicator(color: AppColors.brand)),
        AsyncValue(hasError: true) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 32, color: AppColors.bad),
                  const SizedBox(height: 10),
                  Text(
                    authState.error is AppException ? (authState.error! as AppException).message : 'Impossible de charger le profil.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.ink2),
                  ),
                  const SizedBox(height: 14),
                  OutlinedButton(
                    onPressed: () => ref.read(authControllerProvider.notifier).refreshProfile(),
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            ),
          ),
        _ => Center(
            child: OutlinedButton(
              onPressed: () => ref.read(authControllerProvider.notifier).refreshProfile(),
              child: const Text('Charger le profil'),
            ),
          ),
      },
    );
  }
}

class _ProfileContent extends ConsumerWidget {
  const _ProfileContent({required this.user});

  final UserModel user;

  String get _displayName => user.name.trim().isNotEmpty ? user.name.trim() : user.email;

  String get _initiales {
    final parts = _displayName.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 26),
      children: [
        Center(
          child: Column(
            children: [
              Container(
                width: 76,
                height: 76,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColors.brand, borderRadius: BorderRadius.circular(22)),
                child: Text(_initiales, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(height: 14),
              Text(_displayName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: -0.3)),
              const SizedBox(height: 3),
              Text(user.email, style: const TextStyle(fontSize: 13, color: AppColors.ink3, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Container(
          decoration: BoxDecoration(color: AppColors.card, border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              _InfoRow(icon: Icons.mail_outline_rounded, label: 'Email', value: user.email, showDivider: true),
              if (user.phone != null) _InfoRow(icon: Icons.call_outlined, label: 'Téléphone', value: user.phone!, showDivider: true),
              _InfoRow(icon: Icons.business_outlined, label: 'Organisation', value: user.tenantName ?? user.tenantSlug, showDivider: false),
            ],
          ),
        ),
        const SizedBox(height: 28),
        SizedBox(
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () => _confirmerDeconnexion(context, ref),
            icon: const Icon(Icons.logout_rounded, size: 18),
            label: const Text('Se déconnecter', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.bad,
              side: const BorderSide(color: AppColors.bad),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmerDeconnexion(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Se déconnecter'),
        content: const Text('Voulez-vous vraiment vous déconnecter ?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Annuler')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.bad),
            child: const Text('Se déconnecter'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      // Le guard de go_router (voir core/router/app_router.dart) observe
      // authControllerProvider et redirige seul vers /login une fois l'état
      // repassé à "déconnecté" — aucune navigation manuelle ici.
      await ref.read(authControllerProvider.notifier).logout();
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label, required this.value, required this.showDivider});

  final IconData icon;
  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(border: showDivider ? const Border(bottom: BorderSide(color: AppColors.lineSoft)) : null),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: AppColors.sunken, borderRadius: BorderRadius.circular(9)),
            child: Icon(icon, size: 15, color: AppColors.ink2),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.ink3)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: AppColors.ink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
