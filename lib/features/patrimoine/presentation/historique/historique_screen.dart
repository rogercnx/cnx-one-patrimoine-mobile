import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/format/app_format.dart';
import '../../../../theme/app_colors.dart';
import '../../data/models/campagne_historique_model.dart';
import '../../data/models/comptage_model.dart';
import '../../data/models/immobilisation_model.dart';
import '../patrimoine_providers.dart';
import '../shared/async_state_views.dart';
import '../shared/patrimoine_widgets.dart';

class HistoriqueScreen extends ConsumerStatefulWidget {
  const HistoriqueScreen({super.key});

  @override
  ConsumerState<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

enum _Onglet { session, campagnes }

class _HistoriqueScreenState extends ConsumerState<HistoriqueScreen> {
  _Onglet _onglet = _Onglet.session;

  @override
  Widget build(BuildContext context) {
    final registryAsync = ref.watch(patrimoineRegistryProvider);
    final sessionAsync = ref.watch(comptagesSessionProvider);
    final clotureesAsync = ref.watch(campagnesClotureesProvider);

    return Scaffold(
      appBar: const _Title(),
      body: registryAsync.when(
        loading: () => const LoadingView(),
        error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(patrimoineRegistryProvider)),
        data: (registry) => sessionAsync.when(
          loading: () => const LoadingView(),
          error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(comptagesSessionProvider)),
          data: (session) => ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 26),
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(color: AppColors.sunken, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    _Segment(label: 'Ma session', selected: _onglet == _Onglet.session, onTap: () => setState(() => _onglet = _Onglet.session)),
                    _Segment(label: 'Campagnes clôturées', selected: _onglet == _Onglet.campagnes, onTap: () => setState(() => _onglet = _Onglet.campagnes)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (_onglet == _Onglet.session)
                _SessionView(registry: registry, session: session)
              else
                clotureesAsync.when(
                  loading: () => const Padding(padding: EdgeInsets.only(top: 40), child: LoadingView()),
                  error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(campagnesClotureesProvider)),
                  data: (campagnes) => _CampagnesCloturees(campagnes: campagnes, immobilisations: registry.immobilisations),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget implements PreferredSizeWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('INVENTAIRES EFFECTUÉS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.1, color: AppColors.ink4)),
          Text('Historique', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.6, color: AppColors.ink)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}

class _Segment extends StatelessWidget {
  const _Segment({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.card : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
            boxShadow: selected ? const [BoxShadow(color: Color(0x14000000), blurRadius: 2)] : null,
          ),
          child: Text(
            label,
            style: TextStyle(fontSize: 12.5, fontWeight: selected ? FontWeight.w700 : FontWeight.w600, color: selected ? AppColors.ink : AppColors.ink3),
          ),
        ),
      ),
    );
  }
}

class _SessionView extends StatelessWidget {
  const _SessionView({required this.registry, required this.session});

  final PatrimoineRegistry registry;
  final List<ComptageModel> session;

  @override
  Widget build(BuildContext context) {
    final lignes = session.reversed.toList();
    final ecarts = session.where((s) => s.resultat.name != 'ok').length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${registry.campagne.reference} · EN COURS', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: AppColors.ink4)),
                    const SizedBox(height: 3),
                    Text(registry.agent.nom, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, letterSpacing: -0.3)),
                    const SizedBox(height: 3),
                    Text('${session.length} biens comptés · $ecarts écart${ecarts > 1 ? 's' : ''}', style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const AppChip(label: 'Session ouverte', bg: AppColors.goodBg, fg: AppColors.good, dot: true),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const SectionTitle(title: 'Comptages du jour'),
        AppCard(
          child: lignes.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Center(child: Text('Aucun comptage enregistré pour le moment.', style: TextStyle(fontSize: 13, color: AppColors.ink3, fontWeight: FontWeight.w600))),
                )
              : Column(
                  children: [
                    for (final (i, l) in lignes.indexed)
                      _LigneComptage(
                        comptage: l,
                        immo: registry.immobilisations.where((m) => m.id == l.immobilisationId).firstOrNull,
                        showDivider: i != lignes.length - 1,
                        onTap: () => context.push('/fiche/${l.immobilisationId}'),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _CampagnesCloturees extends StatelessWidget {
  const _CampagnesCloturees({required this.campagnes, required this.immobilisations});

  final List<CampagneHistoriqueModel> campagnes;
  final List<ImmobilisationModel> immobilisations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final c in campagnes) ...[
          AppCard(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            onTap: () => _ouvrirDetail(context, c),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(c.reference, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: AppColors.ink4)),
                          const SizedBox(height: 3),
                          Text(c.libelle, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, letterSpacing: -0.3, height: 1.25)),
                          const SizedBox(height: 3),
                          Text(c.periodeLabel, style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 4), child: Icon(Icons.chevron_right_rounded, size: 17, color: AppColors.ink4)),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    _StatCell(label: 'Biens comptés', value: '${c.biensComptes}/${c.totalBiens}', color: AppColors.ink),
                    _StatCell(label: 'Écarts', value: '${c.ecarts}', color: AppColors.warn),
                    _StatCell(label: 'Introuvables', value: '${c.introuvables}', color: c.introuvables > 0 ? AppColors.bad : AppColors.ink, isLast: true),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
        ],
      ],
    );
  }

  void _ouvrirDetail(BuildContext context, CampagneHistoriqueModel campagne) {
    showAppBottomSheet(
      context: context,
      title: campagne.libelle,
      subtitle: '${campagne.reference} · ${campagne.periodeLabel}',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Comptages par utilisateur'),
              AppCard(
                child: Column(
                  children: [
                    for (final (i, a) in campagne.contributions.indexed)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(border: i == campagne.contributions.length - 1 ? null : const Border(bottom: BorderSide(color: AppColors.lineSoft))),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: AppColors.sunken, borderRadius: BorderRadius.circular(10)),
                              child: Text(_initiales(a.nom), style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: AppColors.ink2)),
                            ),
                            const SizedBox(width: 11),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(a.nom, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                                      Text('${a.biensComptes} biens · ${a.ecarts} écarts', style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.ink3)),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(999),
                                    child: LinearProgressIndicator(
                                      value: campagne.biensComptes == 0 ? 0 : a.biensComptes / campagne.biensComptes,
                                      minHeight: 5,
                                      backgroundColor: AppColors.sunken,
                                      valueColor: const AlwaysStoppedAnimation(AppColors.brand),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Mouvements relevés'),
              AppCard(
                child: Column(
                  children: [
                    for (final (i, l) in campagne.mouvements.indexed)
                      _LigneComptage(
                        comptage: l,
                        immo: immobilisations.where((m) => m.id == l.immobilisationId).firstOrNull,
                        showDivider: i != campagne.mouvements.length - 1,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _initiales(String nom) => nom.split(' ').where((p) => p.isNotEmpty).map((p) => p[0]).take(2).join();
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.label, required this.value, required this.color, this.isLast = false});

  final String label;
  final String value;
  final Color color;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: isLast ? 0 : 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: const BoxDecoration(color: AppColors.soft),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.4, color: AppColors.ink4)),
            const SizedBox(height: 2),
            Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.4)),
          ],
        ),
      ),
    );
  }
}

class _LigneComptage extends StatelessWidget {
  const _LigneComptage({required this.comptage, required this.immo, required this.showDivider, this.onTap});

  final ComptageModel comptage;
  final ImmobilisationModel? immo;
  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(border: showDivider ? const Border(bottom: BorderSide(color: AppColors.lineSoft)) : null),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: comptage.resultat.background, borderRadius: BorderRadius.circular(10)),
              child: Icon(comptage.resultat.icon, size: 15, color: comptage.resultat.color),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text(
                          immo?.designation ?? comptage.immobilisationId,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(AppFormat.time(comptage.dateHeure), style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: AppColors.ink4)),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text('${comptage.immobilisationId} · ${comptage.agentNom}', style: const TextStyle(fontSize: 11, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                  if (comptage.note != null) ...[
                    const SizedBox(height: 3),
                    Text(comptage.note!, style: const TextStyle(fontSize: 11.5, color: AppColors.ink2, fontWeight: FontWeight.w500, height: 1.4)),
                  ],
                  const SizedBox(height: 6),
                  AppChip(label: comptage.resultat.label, bg: comptage.resultat.background, fg: comptage.resultat.color, small: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
