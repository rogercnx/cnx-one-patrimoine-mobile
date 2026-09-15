import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/format/app_format.dart';
import '../../../../theme/app_colors.dart';
import '../../data/models/comptage_input_model.dart';
import '../../data/models/comptage_model.dart';
import '../../data/models/immobilisation_enums.dart';
import '../../data/models/immobilisation_model.dart';
import '../../data/models/patrimoine_enums.dart';
import '../../data/models/site_model.dart';
import '../patrimoine_providers.dart';
import '../shared/async_state_views.dart';
import '../shared/patrimoine_widgets.dart';

/// Fiche complète d'un bien + formulaire de validation du comptage.
/// Poussée en plein écran (route modale) depuis Accueil, Scanner ou Historique.
class FicheDetailScreen extends ConsumerStatefulWidget {
  const FicheDetailScreen({super.key, required this.immobilisationId});

  final String immobilisationId;

  @override
  ConsumerState<FicheDetailScreen> createState() => _FicheDetailScreenState();
}

class _FicheDetailScreenState extends ConsumerState<FicheDetailScreen> {
  EtatBien? _etat;
  String? _siteId;
  String? _local;
  String? _affectataire;
  final _noteController = TextEditingController();
  bool _envoi = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _initSiNecessaire(ImmobilisationModel immo, ComptageModel? deja) {
    // `?? ''` : site/local/affectataire peuvent être `null` côté API réelle
    // (immobilisation générée depuis un dossier minimal, sans ces champs
    // renseignés) — évite un `!` sur `null` juste après. Pas de champ
    // "local" dans le vrai comptage (seul `site_constate` existe côté
    // backend) : `_local` s'initialise uniquement depuis la fiche.
    _etat ??= deja?.etatConstate ?? immo.etat;
    _siteId ??= deja?.siteConstate ?? immo.siteId ?? '';
    _local ??= immo.local ?? '';
    _affectataire ??= deja?.affectataireConstate ?? immo.affectataire ?? '';
  }

  Future<void> _valider(ImmobilisationModel immo, {ResultatInventaire? force}) async {
    final etatChange = _etat != immo.etat;
    final lieuChange = _siteId != immo.siteId; // "local" non transmis : pas de champ backend confirmé.
    final affectChange = _affectataire != immo.affectataire;
    final aUnEcart = etatChange || lieuChange || affectChange;

    final resultat = force ?? (aUnEcart ? ResultatInventaire.ecart : ResultatInventaire.ok);

    final input = ComptageInput(
      immobilisationId: immo.id,
      resultat: resultat,
      etatConstate: etatChange ? _etat : null,
      siteConstate: lieuChange ? _siteId : null,
      affectataireConstate: affectChange ? _affectataire : null,
      note: _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
    );

    setState(() => _envoi = true);
    try {
      await ref.read(comptagesSessionProvider.notifier).valider(input);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          switch (resultat) {
            ResultatInventaire.ok => 'Présence confirmée',
            ResultatInventaire.introuvable => 'Bien signalé introuvable',
            ResultatInventaire.ecart => 'Écart enregistré',
          },
        )));
        Navigator.of(context).maybePop();
      }
    } finally {
      if (mounted) setState(() => _envoi = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final immoAsync = ref.watch(immobilisationProvider(widget.immobilisationId));
    final registryAsync = ref.watch(patrimoineRegistryProvider);
    final sessionAsync = ref.watch(comptagesSessionProvider);

    return Scaffold(
      body: SafeArea(
        child: immoAsync.when(
          loading: () => const LoadingView(),
          error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(immobilisationProvider(widget.immobilisationId))),
          data: (immo) => registryAsync.when(
            loading: () => const LoadingView(),
            error: (e, st) => ErrorView(message: '$e'),
            data: (registry) => sessionAsync.when(
              loading: () => const LoadingView(),
              error: (e, st) => ErrorView(message: '$e'),
              data: (session) {
                final deja = session.where((c) => c.immobilisationId == immo.id).firstOrNull;
                _initSiNecessaire(immo, deja);
                return _FicheBody(
                  immo: immo,
                  sites: registry.sites,
                  deja: deja,
                  etat: _etat!,
                  siteId: _siteId!,
                  local: _local!,
                  affectataire: _affectataire!,
                  noteController: _noteController,
                  envoi: _envoi,
                  onEtatChange: (v) => setState(() => _etat = v),
                  onLieuChange: (site, local) => setState(() {
                    _siteId = site;
                    _local = local;
                  }),
                  onAffectataireChange: (v) => setState(() => _affectataire = v),
                  onValider: () => _valider(immo),
                  onIntrouvable: () => _valider(immo, force: ResultatInventaire.introuvable),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _FicheBody extends ConsumerWidget {
  const _FicheBody({
    required this.immo,
    required this.sites,
    required this.deja,
    required this.etat,
    required this.siteId,
    required this.local,
    required this.affectataire,
    required this.noteController,
    required this.envoi,
    required this.onEtatChange,
    required this.onLieuChange,
    required this.onAffectataireChange,
    required this.onValider,
    required this.onIntrouvable,
  });

  final ImmobilisationModel immo;
  final List<SiteModel> sites;
  final ComptageModel? deja;
  final EtatBien etat;
  final String siteId;
  final String local;
  final String affectataire;
  final TextEditingController noteController;
  final bool envoi;
  final ValueChanged<EtatBien> onEtatChange;
  final void Function(String siteId, String local) onLieuChange;
  final ValueChanged<String> onAffectataireChange;
  final VoidCallback onValider;
  final VoidCallback onIntrouvable;

  bool get _etatModifie => etat != immo.etat;
  bool get _lieuModifie => siteId != immo.siteId || local != immo.local;
  bool get _affectModifie => affectataire != immo.affectataire;
  int get _nbEcarts => [_etatModifie, _lieuModifie, _affectModifie].where((e) => e).length;

  String _siteNom(String id) => sites.where((s) => s.id == id).firstOrNull?.nom ?? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vnc = immo.valeurNetteComptable;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
          decoration: const BoxDecoration(
            color: AppColors.card,
            border: Border(bottom: BorderSide(color: AppColors.line)),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.close_rounded, size: 18),
                style: IconButton.styleFrom(backgroundColor: AppColors.sunken, foregroundColor: AppColors.ink2),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('QR SCANNÉ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5, color: AppColors.ink4)),
                    Text(immo.id, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, letterSpacing: -0.3)),
                  ],
                ),
              ),
              if (deja != null) AppChip(label: 'Compté ${AppFormat.time(deja!.dateHeure)}', bg: deja!.resultat.background, fg: deja!.resultat.color, small: true),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Text(immo.designation, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -0.6, height: 1.2)),
              const SizedBox(height: 9),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  AppChip(label: etat.label, bg: etat.background, fg: etat.color, dot: true),
                  AppChip(label: immo.statut.label, bg: immo.statut.background, fg: immo.statut.color),
                  AppChip(label: immo.categorie, bg: AppColors.sunken, fg: AppColors.ink2),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                height: 120,
                decoration: BoxDecoration(border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(16), color: AppColors.soft),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.photo_camera_outlined, size: 22, color: AppColors.ink3),
                    const SizedBox(height: 6),
                    Text('photo du bien', style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: AppColors.ink3)),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.ink2,
                        side: const BorderSide(color: AppColors.line),
                        backgroundColor: AppColors.card,
                        minimumSize: const Size(0, 30),
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                      ),
                      child: const Text('Prendre une photo', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const SectionTitle(title: 'Vérification sur site'),
              AppCard(
                child: Column(
                  children: [
                    InfoRow(
                      icon: Icons.radio_button_checked_rounded,
                      label: 'État du bien',
                      value: etat.label,
                      sub: _etatModifie ? 'modifié — était « ${immo.etat.label} »' : null,
                      onTap: () => _choisirEtat(context),
                    ),
                    InfoRow(
                      icon: Icons.place_outlined,
                      label: 'Emplacement',
                      value: _siteNom(siteId),
                      sub: _lieuModifie ? '$local — déplacé depuis ${immo.local}' : local,
                      onTap: () => _choisirLieu(context, ref),
                    ),
                    InfoRow(
                      icon: Icons.group_outlined,
                      label: 'Affectation',
                      value: affectataire,
                      sub: _affectModifie ? 'réaffecté — était « ${immo.affectataire} »' : null,
                      showDivider: false,
                      onTap: () => _choisirAffectataire(context, ref),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const SectionTitle(title: "Fiche d'immobilisation"),
              AppCard(
                padding: EdgeInsets.zero,
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.5,
                  children: [
                    _FicheCell('Compte', immo.compteComptable ?? '—'),
                    _FicheCell('Fournisseur', immo.fournisseur ?? '—'),
                    _FicheCell('Acquisition', AppFormat.date(immo.dateAcquisition)),
                    _FicheCell("Valeur d'acquisition", AppFormat.fcfa(immo.valeurAcquisition ?? 0)),
                    _FicheCell('Amortissement', AppFormat.fcfa(immo.montantAmorti)),
                    _FicheCell('Valeur nette', AppFormat.fcfa(vnc)),
                    _FicheCell('Mise en service', AppFormat.date(immo.dateMiseService)),
                    _FicheCell('Dernier inventaire', AppFormat.date(immo.dateDernierInventaire)),
                  ],
                ),
              ),
              if (immo.entretiens.isNotEmpty) ...[
                const SizedBox(height: 18),
                SectionTitle(title: 'Entretiens (${immo.entretiens.length})'),
                AppCard(
                  child: Column(
                    children: [
                      for (final (i, e) in immo.entretiens.indexed)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(border: i == immo.entretiens.length - 1 ? null : const Border(bottom: BorderSide(color: AppColors.lineSoft))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(e.titre, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700))),
                                  Text(AppFormat.date(e.date), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.ink4)),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text('${e.prestataire} · ${AppFormat.fcfa(e.cout)}', style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                              if (e.observation != null) ...[
                                const SizedBox(height: 3),
                                Text(e.observation!, style: const TextStyle(fontSize: 11.5, color: AppColors.ink2, height: 1.4)),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              if (immo.attributions.isNotEmpty) ...[
                const SizedBox(height: 18),
                SectionTitle(title: "Historique d'attribution (${immo.attributions.length})"),
                AppCard(
                  child: Column(
                    children: [
                      for (final (i, a) in immo.attributions.indexed)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(border: i == immo.attributions.length - 1 ? null : const Border(bottom: BorderSide(color: AppColors.lineSoft))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(a.detenteur, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700))),
                                  Text(AppFormat.date(a.date), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.ink4)),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text('${a.motif} · ${a.lieu}', style: const TextStyle(fontSize: 11.5, color: AppColors.ink3, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 18),
              Text('Observation (facultatif)', style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.ink2)),
              const SizedBox(height: 6),
              TextField(
                controller: noteController,
                minLines: 2,
                maxLines: 3,
                style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'Ex. bien retrouvé au magasin, étiquette QR décollée',
                  filled: true,
                  fillColor: AppColors.card,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
                ),
              ),
              if (deja?.note != null) ...[
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                  decoration: BoxDecoration(color: AppColors.soft, border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(12)),
                  child: Text(deja!.note!, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: AppColors.ink2, height: 1.4)),
                ),
              ],
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: const BoxDecoration(color: AppColors.card, border: Border(top: BorderSide(color: AppColors.line))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_nbEcarts > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.warning_amber_rounded, size: 14, color: Color(0xFF8A6412)),
                      const SizedBox(width: 8),
                      Text('$_nbEcarts écart${_nbEcarts > 1 ? 's' : ''} à enregistrer sur ce bien',
                          style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: Color(0xFF8A6412))),
                    ],
                  ),
                ),
              PrimaryButton(
                label: _nbEcarts > 0 ? "Enregistrer et valider l'écart" : 'Confirmer la présence',
                icon: Icons.check_rounded,
                onPressed: envoi ? null : onValider,
              ),
              const SizedBox(height: 9),
              GhostButton(
                label: 'Bien introuvable',
                icon: Icons.warning_amber_rounded,
                foreground: AppColors.bad,
                onPressed: envoi ? null : onIntrouvable,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _choisirEtat(BuildContext context) async {
    await showAppBottomSheet(
      context: context,
      title: 'État du bien',
      subtitle: 'Constaté lors de la campagne en cours',
      child: OptionPicker(
        value: etat.name,
        options: [
          for (final e in EtatBien.values)
            (
              id: e.name,
              label: e.label,
              sub: e == immo.etat ? 'état enregistré au registre' : null,
              tag: Container(width: 10, height: 10, decoration: BoxDecoration(color: e.color, shape: BoxShape.circle)),
            ),
        ],
        onChanged: (id) {
          onEtatChange(EtatBien.values.firstWhere((e) => e.name == id));
          Navigator.of(context).pop();
        },
      ),
    );
  }

  // Site : dropdown (liste réelle, `GET /patrimoine/sites`). Local : saisie
  // libre — aucun endpoint réel ne propose de liste de locaux par site
  // (décision produit actée, CLAUDE.md section 4).
  Future<void> _choisirLieu(BuildContext context, WidgetRef ref) async {
    var siteChoisi = siteId;
    final localController = TextEditingController(text: local);
    await showAppBottomSheet(
      context: context,
      title: 'Emplacement',
      subtitle: 'Site et local où le bien a été trouvé',
      child: StatefulBuilder(
        builder: (context, setSheetState) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              initialValue: siteChoisi,
              decoration: _dropdownDecoration(),
              items: [for (final s in sites) DropdownMenuItem(value: s.id, child: Text(s.nom))],
              onChanged: (v) => setSheetState(() => siteChoisi = v!),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: localController,
              decoration: InputDecoration(
                labelText: 'Local (facultatif)',
                hintText: 'Ex. Étage 3 — DSI',
                filled: true,
                fillColor: AppColors.card,
                contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: "Appliquer l'emplacement",
              onPressed: () {
                onLieuChange(siteChoisi, localController.text.trim());
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    localController.dispose();
  }

  // Saisie libre : aucun endpoint réel ne propose de liste de détenteurs
  // possibles (décision produit actée, CLAUDE.md section 4).
  Future<void> _choisirAffectataire(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController(text: affectataire);
    await showAppBottomSheet(
      context: context,
      title: 'Affectation',
      subtitle: 'Détenteur responsable du bien',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Nouveau détenteur',
              filled: true,
              fillColor: AppColors.card,
              contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: "Appliquer l'affectation",
            onPressed: () {
              onAffectataireChange(controller.text.trim());
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
    controller.dispose();
  }

  InputDecoration _dropdownDecoration() => InputDecoration(
        filled: true,
        fillColor: AppColors.card,
        contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.line)),
      );
}

class _FicheCell extends StatelessWidget {
  const _FicheCell(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.lineSoft), bottom: BorderSide(color: AppColors.lineSoft))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label.toUpperCase(), style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.w800, letterSpacing: 0.4, color: AppColors.ink4)),
          const SizedBox(height: 3),
          Text(value, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700), maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
