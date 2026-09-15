import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/result.dart';
import '../data/models/agent_model.dart';
import '../data/models/campagne_historique_model.dart';
import '../data/models/campagne_model.dart';
import '../data/models/comptage_model.dart';
import '../data/models/immobilisation_model.dart';
import '../data/models/site_model.dart';
import '../data/patrimoine_repository_mock.dart';
import '../domain/patrimoine_repository.dart';

/// Bascule mock ↔ API réelle en un seul endroit (CLAUDE.md section 2.6).
/// Cette tâche est 100% mock : `USE_MOCK` n'est pas câblé sur un `--dart-define`
/// pour l'instant, `PatrimoineRepositoryImpl` (Dio) n'existant pas encore.
final patrimoineRepositoryProvider = Provider<PatrimoineRepository>((ref) {
  return PatrimoineRepositoryMock();
});

final agentConnecteProvider = FutureProvider<AgentModel>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getAgentConnecte();
  return result.unwrap();
});

final campagneEnCoursProvider = FutureProvider<CampagneModel>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getCampagneEnCours();
  return result.unwrap();
});

final sitesProvider = FutureProvider<List<SiteModel>>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getSites();
  return result.unwrap();
});

final immobilisationsProvider = FutureProvider<List<ImmobilisationModel>>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getImmobilisations();
  return result.unwrap();
});

final immobilisationProvider = FutureProvider.family<ImmobilisationModel, String>((ref, id) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getImmobilisation(id);
  return result.unwrap();
});

final campagnesClotureesProvider = FutureProvider<List<CampagneHistoriqueModel>>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getCampagnesCloturees();
  return result.unwrap();
});

final affectatairesPossiblesProvider = FutureProvider<List<String>>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getAffectatairesPossibles();
  return result.unwrap();
});

final locauxDuSiteProvider = FutureProvider.family<List<String>, String>((ref, siteId) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getLocauxDuSite(siteId);
  return result.unwrap();
});

/// Registre "statique" du module (agent connecté, campagne en cours, sites,
/// immobilisations) — ne dépend pas de la session de comptage, donc chargé
/// une seule fois et partagé par les 4 écrans.
typedef PatrimoineRegistry = ({
  AgentModel agent,
  CampagneModel campagne,
  List<SiteModel> sites,
  List<ImmobilisationModel> immobilisations,
});

final patrimoineRegistryProvider = FutureProvider<PatrimoineRegistry>((ref) async {
  final repository = ref.watch(patrimoineRepositoryProvider);
  final agentFuture = repository.getAgentConnecte();
  final campagneFuture = repository.getCampagneEnCours();
  final sitesFuture = repository.getSites();
  final immobilisationsFuture = repository.getImmobilisations();
  return (
    agent: (await agentFuture).unwrap(),
    campagne: (await campagneFuture).unwrap(),
    sites: (await sitesFuture).unwrap(),
    immobilisations: (await immobilisationsFuture).unwrap(),
  );
});

/// Comptages de la session d'inventaire en cours — état partagé (Accueil,
/// Scanner, Historique et Fiche détail l'observent tous), avec une action
/// [valider] qui enregistre un pointage et met à jour l'état local sans
/// tout recharger. Voir CLAUDE.md 2.2 : `StateNotifierProvider`/`AsyncNotifier`
/// pour un état avec transitions.
class ComptagesSessionNotifier extends AsyncNotifier<List<ComptageModel>> {
  @override
  Future<List<ComptageModel>> build() async {
    final result = await ref.watch(patrimoineRepositoryProvider).getComptagesSession();
    return result.unwrap();
  }

  Future<void> valider(ComptageModel comptage) async {
    final repository = ref.read(patrimoineRepositoryProvider);
    final result = await repository.validerComptage(comptage);
    result.unwrap();
    final current = state.value ?? const [];
    state = AsyncData([
      for (final c in current)
        if (c.immobilisationId != comptage.immobilisationId) c,
      comptage,
    ]);
  }
}

final comptagesSessionProvider = AsyncNotifierProvider<ComptagesSessionNotifier, List<ComptageModel>>(
  ComptagesSessionNotifier.new,
);
