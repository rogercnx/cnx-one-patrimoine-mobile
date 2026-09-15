import '../../../core/error/result.dart';
import '../data/models/agent_model.dart';
import '../data/models/campagne_historique_model.dart';
import '../data/models/campagne_model.dart';
import '../data/models/comptage_model.dart';
import '../data/models/immobilisation_model.dart';
import '../data/models/site_model.dart';

/// Contrat du module Patrimoine — la seule chose que la couche `presentation/`
/// connaît. Voir CLAUDE.md section 2.6 : `PatrimoineRepositoryMock` est
/// l'implémentation active tant que le backend Zira24 n'expose pas ces routes ;
/// `PatrimoineRepositoryImpl` (Dio) la remplacera sans qu'un écran ne change.
abstract class PatrimoineRepository {
  /// Agent d'inventaire actuellement connecté.
  Future<Result<AgentModel>> getAgentConnecte();

  /// Campagne d'inventaire en cours (celle affichée à l'Accueil / au Scanner).
  Future<Result<CampagneModel>> getCampagneEnCours();

  /// GET /patrimoine/sites
  Future<Result<List<SiteModel>>> getSites();

  /// GET /patrimoine/immobilisations — filtrable par site.
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({String? siteId});

  /// GET /patrimoine/immobilisations/:id — fiche complète (entretiens, attributions, photos inclus).
  Future<Result<ImmobilisationModel>> getImmobilisation(String id);

  /// GET /patrimoine/lookup/qr/:code — résout un QR/code saisi manuellement.
  /// Retourne `Success(null)` si aucun bien ne correspond (pas une erreur réseau).
  Future<Result<ImmobilisationModel?>> resoudreCode(String code);

  /// GET /patrimoine/campagnes/:id/comptages — comptages déjà effectués dans la session en cours.
  Future<Result<List<ComptageModel>>> getComptagesSession();

  /// POST /patrimoine/campagnes/:id/comptages — valide (ou corrige) un comptage.
  Future<Result<void>> validerComptage(ComptageModel comptage);

  /// Campagnes d'inventaire clôturées, avec la contribution de chaque agent.
  Future<Result<List<CampagneHistoriqueModel>>> getCampagnesCloturees();

  /// Détenteurs proposés lors d'un changement d'affectation.
  Future<Result<List<String>>> getAffectatairesPossibles();

  /// Locaux proposés pour un site donné, lors d'un changement d'emplacement.
  Future<Result<List<String>>> getLocauxDuSite(String siteId);
}
