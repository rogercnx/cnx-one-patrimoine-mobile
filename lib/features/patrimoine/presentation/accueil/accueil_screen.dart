import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/format/app_format.dart';
import '../../../../theme/app_colors.dart';
import '../../data/models/comptage_model.dart';
import '../../data/models/immobilisation_model.dart';
import '../../data/models/site_model.dart';
import '../patrimoine_providers.dart';
import '../shared/async_state_views.dart';
import '../shared/patrimoine_widgets.dart';

class AccueilScreen extends ConsumerWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registryAsync = ref.watch(patrimoineRegistryProvider);
    final sessionAsync = ref.watch(comptagesSessionProvider);
    final agent = ref.watch(agentAffichageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(eyebrow: 'PATRIMOINE · CNX-ONE', title: 'Inventaire'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: registryAsync.when(
        loading: () => const LoadingView(),
        error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(patrimoineRegistryProvider)),
        data: (registry) => sessionAsync.when(
          loading: () => const LoadingView(),
          error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(comptagesSessionProvider)),
          data: (session) => _AccueilContent(
            agentNom: agent.nom,
            agentRole: agent.role,
            agentInitiales: agent.initiales,
            campagneRef: registry.campagne.reference,
            campagneLibelle: registry.campagne.libelle,
            campagneDebut: registry.campagne.dateDebut,
            campagneFin: registry.campagne.dateFin,
            joursRestants: registry.campagne.joursRestants(DateTime.now()),
            sites: registry.sites,
            immobilisations: registry.immobilisations,
            session: session,
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({required this.eyebrow, required this.title});

  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(eyebrow, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.1, color: AppColors.ink4)),
        Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.6, color: AppColors.ink)),
      ],
    );
  }
}

class _AccueilContent extends StatelessWidget {
  const _AccueilContent({
    required this.agentNom,
    required this.agentRole,
    required this.agentInitiales,
    required this.campagneRef,
    required this.campagneLibelle,
    required this.campagneDebut,
    required this.campagneFin,
    required this.joursRestants,
    required this.sites,
    required this.immobilisations,
    required this.session,
  });

  final String agentNom;
  final String agentRole;
  final String agentInitiales;
  final String campagneRef;
  final String campagneLibelle;
  final DateTime campagneDebut;
  final DateTime? campagneFin;
  final int joursRestants;
  final List<SiteModel> sites;
  final List<ImmobilisationModel> immobilisations;
  final List<ComptageModel> session;

  ImmobilisationModel? _immo(String id) {
    for (final m in immobilisations) {
      if (m.id == id) return m;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final total = immobilisations.length;
    final comptes = session.length;
    final pct = total == 0 ? 0.0 : comptes / total;
    final ecarts = session.where((s) => s.resultat.name != 'ok').length;
    final introuvables = session.where((s) => s.resultat.name == 'introuvable').length;
    final sitesVus = session.map((s) => _immo(s.immobilisationId)?.siteId).whereType<String>().toSet().length;

    final parSite = sites
        .map((site) {
          final biens = immobilisations.where((m) => m.siteId == site.id).toList();
          final faits = biens.where((m) => session.any((s) => s.immobilisationId == m.id)).length;
          return (site: site, total: biens.length, faits: faits);
        })
        .where((e) => e.total > 0)
        .toList()
      ..sort((a, b) => b.total.compareTo(a.total));

    final derniers = session.reversed.take(4).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 26),
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.brand, borderRadius: BorderRadius.circular(13)),
              child: Text(agentInitiales, style: const TextStyle(color: Colors.white, fontSize: 14.5, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(agentNom, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w800, letterSpacing: -0.3)),
                  Text(agentRole, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            AppChip(label: 'J−$joursRestants', bg: AppColors.warnBg, fg: const Color(0xFF8A6412), small: true),
          ],
        ),
        const SizedBox(height: 20),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProgressRing(
                    value: pct,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${(pct * 100).round()}%', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: -0.6)),
                        const Text('COMPTÉS', style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700, color: AppColors.ink4, letterSpacing: 0.6)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(campagneRef, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: AppColors.ink4)),
                        const SizedBox(height: 3),
                        Text(campagneLibelle, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: -0.3, height: 1.25)),
                        const SizedBox(height: 3),
                        Text('$comptes / $total biens · ${total - comptes} restants', style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                        Text(
                          '${AppFormat.date(campagneDebut)} → ${AppFormat.date(campagneFin)}',
                          style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              PrimaryButton(
                label: 'Scanner un bien',
                icon: Icons.qr_code_scanner_rounded,
                onPressed: () => context.go('/scanner'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.7,
          children: [
            KpiTile(label: "Comptés aujourd'hui", value: '$comptes', sub: 'par $agentNom'),
            KpiTile(label: 'Écarts relevés', value: '$ecarts', tone: AppColors.warn, sub: '$introuvables introuvable${introuvables > 1 ? 's' : ''}'),
            KpiTile(label: 'Restants', value: '${total - comptes}', sub: 'dans mon périmètre'),
            KpiTile(label: 'Sites couverts', value: '$sitesVus/${parSite.length}', sub: 'au moins 1 bien'),
          ],
        ),
        const SizedBox(height: 20),
        const SectionTitle(title: 'Avancement par site'),
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              for (final (i, s) in parSite.indexed)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: i == parSite.length - 1 ? null : const Border(bottom: BorderSide(color: AppColors.lineSoft)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(s.site.nom, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                          Text(
                            '${s.faits}/${s.total}',
                            style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: s.faits == s.total ? AppColors.good : AppColors.ink3),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          value: s.total == 0 ? 0 : s.faits / s.total,
                          minHeight: 6,
                          backgroundColor: AppColors.sunken,
                          valueColor: AlwaysStoppedAnimation(s.faits == s.total ? AppColors.good : AppColors.brand),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Derniers comptages', action: "Tout l'historique", onAction: () => context.go('/historique')),
        AppCard(
          child: Column(
            children: [
              if (derniers.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: Text('Aucun comptage pour le moment', style: TextStyle(fontSize: 12.5, color: AppColors.ink3, fontWeight: FontWeight.w600))),
                ),
              for (final (i, l) in derniers.indexed)
                InkWell(
                  onTap: () => context.push('/fiche/${l.immobilisationId}'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      border: i == derniers.length - 1 ? null : const Border(bottom: BorderSide(color: AppColors.lineSoft)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: l.resultat.background, borderRadius: BorderRadius.circular(10)),
                          child: Icon(l.resultat.icon, size: 15, color: l.resultat.color),
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _immo(l.immobilisationId)?.designation ?? l.immobilisationId,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${l.immobilisationId} · ${AppFormat.time(l.dateHeure)}',
                                style: const TextStyle(fontSize: 11, color: AppColors.ink3, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        AppChip(label: l.resultat.label, bg: l.resultat.background, fg: l.resultat.color, small: true),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
