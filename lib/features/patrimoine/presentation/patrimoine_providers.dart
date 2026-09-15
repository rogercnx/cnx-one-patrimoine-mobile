import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/result.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../auth/presentation/auth_providers.dart';
import '../data/models/campagne_model.dart';
import '../data/models/comptage_input_model.dart';
import '../data/models/comptage_model.dart';
import '../data/models/immobilisation_model.dart';
import '../data/models/site_model.dart';
import '../data/patrimoine_repository_impl.dart';
import '../domain/patrimoine_repository.dart';

/// Bascule mock ↔ API réelle en un seul endroit (CLAUDE.md section 2.6).
/// Basculé sur [PatrimoineRepositoryImpl] depuis la validation manuelle du
/// 2026-09-15 (lecture + comptage testés en conditions réelles sur
/// `dev-seeg`) — réutilise le `dioProvider` partagé avec Auth (mêmes
/// intercepteurs : JWT, X-API-Key). `PatrimoineRepositoryMock` reste
/// disponible pour les tests unitaires.
final patrimoineRepositoryProvider = Provider<PatrimoineRepository>((ref) {
  return PatrimoineRepositoryImpl(ref.watch(dioProvider));
});

/// Vue d'affichage de l'agent connecté — dérivée du profil Auth
/// (`authControllerProvider`, déjà chargé après login). Patrimoine n'a plus
/// de notion "agent" propre : aucune route backend ne l'expose (décision
/// produit actée, CLAUDE.md section 4).
typedef AgentAffichage = ({String nom, String role, String initiales});

final agentAffichageProvider = Provider<AgentAffichage>((ref) {
  final user = ref.watch(authControllerProvider).valueOrNull;
  final nom = (user != null && user.name.trim().isNotEmpty) ? user.name.trim() : (user?.email ?? '');
  return (nom: nom, role: user?.role ?? '', initiales: _initiales(nom));
});

String _initiales(String nom) {
  final parts = nom.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toList();
  if (parts.isEmpty) return '?';
  if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
  return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
}

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

/// Campagnes clôturées — `CampagneModel` réel (plus d'agrégats
/// contributions/mouvements, aucun endpoint réel ne les fournit). Le détail
/// d'une campagne clôturée se lit via [comptagesDeCampagneProvider].
final campagnesClotureesProvider = FutureProvider<List<CampagneModel>>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getCampagnesCloturees();
  return result.unwrap();
});

/// Comptages réels d'une campagne donnée (tous agents confondus) — utilisé
/// par l'écran Historique pour le détail d'une campagne clôturée.
final comptagesDeCampagneProvider = FutureProvider.family<List<ComptageModel>, String>((ref, campagneId) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getComptagesReels(campagneId);
  return result.unwrap();
});

/// Registre "statique" du module (campagne en cours, sites, immobilisations)
/// — ne dépend pas de la session de comptage, donc chargé une seule fois et
/// partagé par les 4 écrans.
typedef PatrimoineRegistry = ({
  CampagneModel campagne,
  List<SiteModel> sites,
  List<ImmobilisationModel> immobilisations,
});

final patrimoineRegistryProvider = FutureProvider<PatrimoineRegistry>((ref) async {
  final repository = ref.watch(patrimoineRepositoryProvider);
  final campagneFuture = repository.getCampagneEnCours();
  final sitesFuture = repository.getSites();
  final immobilisationsFuture = repository.getImmobilisations();
  return (
    campagne: (await campagneFuture).unwrap(),
    sites: (await sitesFuture).unwrap(),
    immobilisations: (await immobilisationsFuture).unwrap(),
  );
});

/// Comptages de "ma session" — désormais une simple projection serveur
/// (`getComptagesReels`, filtrée sur l'agent connecté), plus d'état local
/// indépendant du serveur (décision produit actée, CLAUDE.md section 4).
/// [valider] appelle directement `validerComptage` (vrai `POST
/// /campagnes/:id/comptages`, idempotence confirmée par appel réel).
class ComptagesSessionNotifier extends AsyncNotifier<List<ComptageModel>> {
  @override
  Future<List<ComptageModel>> build() async {
    final userId = ref.watch(authControllerProvider).valueOrNull?.id;
    if (userId == null) return const [];
    final campagne = await ref.watch(campagneEnCoursProvider.future);
    final result = await ref.watch(patrimoineRepositoryProvider).getComptagesReels(campagne.id, agentId: userId);
    return result.unwrap();
  }

  Future<void> valider(ComptageInput input) async {
    final repository = ref.read(patrimoineRepositoryProvider);
    final campagne = await ref.read(campagneEnCoursProvider.future);
    final result = await repository.validerComptage(campagne.id, input);
    final nouveau = result.unwrap();
    final current = state.value ?? const [];
    state = AsyncData([
      for (final c in current)
        if (c.immobilisationId != nouveau.immobilisationId) c,
      nouveau,
    ]);
  }
}

final comptagesSessionProvider = AsyncNotifierProvider<ComptagesSessionNotifier, List<ComptageModel>>(
  ComptagesSessionNotifier.new,
);
