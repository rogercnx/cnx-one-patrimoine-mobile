import '../../../core/error/result.dart';
import '../domain/patrimoine_repository.dart';
import '../domain/photo_transport.dart';
import 'mock/patrimoine_mock_data.dart';
import 'models/attribution_model.dart';
import 'models/campagne_model.dart';
import 'models/comptage_input_model.dart';
import 'models/comptage_model.dart';
import 'models/dossier_input_model.dart';
import 'models/dossier_model.dart';
import 'models/entretien_model.dart';
import 'models/immobilisation_enums.dart';
import 'models/immobilisation_model.dart';
import 'models/livraison_input_model.dart';
import 'models/offre_input_model.dart';
import 'models/patrimoine_enums.dart';
import 'models/photo_model.dart';
import 'models/site_model.dart';
import 'models/sortie_input_model.dart';
import 'models/validation_input_model.dart';
import 'models/workflow_etape_model.dart';
import 'models/workflow_groupe_model.dart';

/// Implémentation mock de [PatrimoineRepository] — utilisée tant que le
/// backend Zira24 n'expose pas les routes `/patrimoine/...` (CLAUDE.md 2.6).
/// Simule une latence réseau réaliste pour que le loading state des écrans
/// soit visible et testable comme avec une vraie API.
///
/// Le circuit Dossiers (workflow complet) n'a jamais eu de jeu de données
/// mock — hors périmètre de l'écran mobile actuel (CLAUDE.md 3.1, Partie 2
/// "extension future"). Ces méthodes renvoient une [Failure] explicite
/// plutôt que d'inventer un faux registre de dossiers.
class PatrimoineRepositoryMock implements PatrimoineRepository {
  Future<void> _latence() => Future.delayed(const Duration(milliseconds: 400));

  Failure<T> _nonDisponibleEnMock<T>() => const Failure(ServerException("Non disponible en mode mock — nécessite l'API réelle."));

  @override
  Future<Result<CampagneModel>> getCampagneEnCours() async {
    await _latence();
    return Success(PatrimoineMockData.campagneEnCours);
  }

  @override
  Future<Result<List<SiteModel>>> getSites() async {
    await _latence();
    return Success(PatrimoineMockData.sites);
  }

  @override
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({
    String? siteId,
    StatutBien? statut,
    EtatBien? etat,
    String? categorie,
    String? q,
    int page = 1,
    int limit = 20,
  }) async {
    // Filtres/pagination ignorés ici : le mock renvoie tout, la pagination
    // et les filtres n'ont de sens que côté API réelle (PatrimoineRepositoryImpl).
    await _latence();
    final all = PatrimoineMockData.immobilisations;
    return Success(siteId == null ? all : all.where((m) => m.siteId == siteId).toList());
  }

  @override
  Future<Result<ImmobilisationModel>> getImmobilisation(String id) async {
    await _latence();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == id);
    if (match.isEmpty) return Failure(NotFoundException('Bien introuvable : $id'));
    return Success(match.first);
  }

  @override
  Future<Result<List<EntretienModel>>> getEntretiens(String immobilisationId) async {
    await _latence();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == immobilisationId);
    return Success(match.isEmpty ? const [] : match.first.entretiens);
  }

  @override
  Future<Result<List<AttributionModel>>> getAttributions(String immobilisationId) async {
    await _latence();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == immobilisationId);
    return Success(match.isEmpty ? const [] : match.first.attributions);
  }

  @override
  Future<Result<List<PhotoModel>>> getPhotos(String immobilisationId) async {
    await _latence();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == immobilisationId);
    return Success(match.isEmpty ? const [] : match.first.photos);
  }

  @override
  Future<Result<FichierBinaire>> getPhotoFichierContent({
    required String immobilisationId,
    required String photoId,
    required String fichierId,
  }) async {
    await _latence();
    return const Failure(NotFoundException('Fichier binaire non disponible en mode mock.'));
  }

  @override
  Future<Result<ImmobilisationModel?>> resoudreCode(String code) async {
    await _latence();
    final v = code.trim().toUpperCase();
    final match = PatrimoineMockData.immobilisations.where((m) => m.id == v || m.id.endsWith(v));
    return Success(match.isEmpty ? null : match.first);
  }

  @override
  Future<Result<List<ComptageModel>>> getComptagesReels(String campagneId, {String? agentId}) async {
    await _latence();
    return const Success([]);
  }

  @override
  Future<Result<List<CampagneModel>>> getCampagnesCloturees() async {
    await _latence();
    return Success(PatrimoineMockData.campagnesCloturees);
  }

  // ---------------------------------------------------------------------
  // Circuit Dossiers (workflow complet) — jamais eu de jeu de données mock.
  // ---------------------------------------------------------------------

  @override
  Future<Result<List<DossierModel>>> getDossiers({GroupeId? groupe, EtapeId? etape, String? site, String? departement, bool? alerte}) async {
    await _latence();
    return Success(const []);
  }

  @override
  Future<Result<DossierModel>> getDossier(String id) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<List<WorkflowGroupeModel>>> getGroupes() async {
    await _latence();
    return Success(const []);
  }

  @override
  Future<Result<List<WorkflowEtapeModel>>> getEtapes() async {
    await _latence();
    return Success(const []);
  }

  @override
  Future<Result<List<dynamic>>> getKpiAlertes() async {
    await _latence();
    return Success(const []);
  }

  @override
  Future<Result<ComptageModel>> validerComptage(String campagneId, ComptageInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<ComptageModel>> corrigerComptage(String campagneId, String comptageId, ComptageInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<PhotoModel>> uploadPhoto(String immobilisationId, {required List<PhotoAEnvoyer> fichiers, String? titre, String? message, String? auteur}) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> creerDossier(DossierInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> modifierDossier(String id, DossierInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> validerDossier(String dossierId, ValidationInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> ajouterOffre(String dossierId, OffreInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> selectionnerOffre(String dossierId, String offreId) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> ajouterLivraison(String dossierId, LivraisonInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> qualifierDossier(String dossierId, Qualification qualification) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<List<String>>> genererImmobilisations(String dossierId, {int? quantite}) async {
    await _latence();
    return _nonDisponibleEnMock();
  }

  @override
  Future<Result<DossierModel>> declarerSortie(String dossierId, SortieInput input) async {
    await _latence();
    return _nonDisponibleEnMock();
  }
}
