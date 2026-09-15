import '../../../core/error/result.dart';
import '../data/models/attribution_model.dart';
import '../data/models/campagne_model.dart';
import '../data/models/comptage_input_model.dart';
import '../data/models/comptage_model.dart';
import '../data/models/dossier_input_model.dart';
import '../data/models/dossier_model.dart';
import '../data/models/entretien_model.dart';
import '../data/models/immobilisation_enums.dart';
import '../data/models/immobilisation_model.dart';
import '../data/models/livraison_input_model.dart';
import '../data/models/offre_input_model.dart';
import '../data/models/patrimoine_enums.dart';
import '../data/models/photo_model.dart';
import '../data/models/site_model.dart';
import '../data/models/sortie_input_model.dart';
import '../data/models/validation_input_model.dart';
import '../data/models/workflow_etape_model.dart';
import '../data/models/workflow_groupe_model.dart';
import 'photo_transport.dart';

/// Contrat du module Patrimoine — la seule chose que la couche `presentation/`
/// connaît. Voir CLAUDE.md section 2.6 : `PatrimoineRepositoryMock` est
/// l'implémentation active tant que le backend Zira24 n'expose pas ces routes ;
/// `PatrimoineRepositoryImpl` (Dio) la remplacera sans qu'un écran ne change.
abstract class PatrimoineRepository {
  /// Campagne d'inventaire en cours (celle affichée à l'Accueil / au Scanner).
  Future<Result<CampagneModel>> getCampagneEnCours();

  /// Campagnes d'inventaire clôturées — `GET /patrimoine/campagnes?statut=
  /// cloturee` (même route que [getCampagneEnCours], filtre différent,
  /// confirmé par la doc Seven §4 : ce n'était pas un trou de schéma).
  Future<Result<List<CampagneModel>>> getCampagnesCloturees();

  /// GET /patrimoine/lookup/qr/:code — résout un QR/code saisi manuellement.
  /// Route confirmée dans la liste des 29 routes ; schéma de réponse non
  /// documenté par Seven — testé en conditions réelles (voir historique de
  /// la tâche de bascule sur l'API réelle). Retourne `Success(null)` si
  /// aucun bien ne correspond (pas une erreur réseau).
  Future<Result<ImmobilisationModel?>> resoudreCode(String code);

  // ---------------------------------------------------------------------
  // Lecture — confirmé par la doc Seven (2026-09-15, schémas Patrimoine).
  // ---------------------------------------------------------------------

  /// GET /patrimoine/sites
  Future<Result<List<SiteModel>>> getSites();

  /// GET /patrimoine/immobilisations — filtres confirmés (§4 doc Seven) :
  /// `site`, `statut`, `etat`, `categorie`, `q`. Paginé (page=1/limit=20 par
  /// défaut, limit plafonné à 200) — seule liste paginée de tout l'espace
  /// Patrimoine.
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({
    String? siteId,
    StatutBien? statut,
    EtatBien? etat,
    String? categorie,
    String? q,
    int page = 1,
    int limit = 20,
  });

  /// GET /patrimoine/immobilisations/:id
  Future<Result<ImmobilisationModel>> getImmobilisation(String id);

  /// GET /patrimoine/immobilisations/:id/entretiens
  Future<Result<List<EntretienModel>>> getEntretiens(String immobilisationId);

  /// GET /patrimoine/immobilisations/:id/attributions
  Future<Result<List<AttributionModel>>> getAttributions(String immobilisationId);

  /// GET /patrimoine/immobilisations/:id/photos
  Future<Result<List<PhotoModel>>> getPhotos(String immobilisationId);

  /// GET /patrimoine/immobilisations/:id/photos/:photoId/fichiers/:fichierId/content
  /// — binaire brut proxifié par le serveur (doc Seven §6).
  Future<Result<FichierBinaire>> getPhotoFichierContent({
    required String immobilisationId,
    required String photoId,
    required String fichierId,
  });

  /// GET /patrimoine/campagnes/:id/comptages?agent_id= — comptages réels
  /// d'une campagne. C'est la seule source de vérité pour la "session" de
  /// comptage affichée à l'écran (voir `ComptagesSessionNotifier`, filtrée
  /// sur l'agent connecté via `agentId`) — plus d'état local indépendant.
  Future<Result<List<ComptageModel>>> getComptagesReels(String campagneId, {String? agentId});

  /// GET /patrimoine/dossiers — filtres confirmés (§4 doc Seven) : `groupe`,
  /// `etape`, `site`, `departement`, `alerte`. Non paginé.
  Future<Result<List<DossierModel>>> getDossiers({
    GroupeId? groupe,
    EtapeId? etape,
    String? site,
    String? departement,
    bool? alerte,
  });

  /// GET /patrimoine/dossiers/:id
  Future<Result<DossierModel>> getDossier(String id);

  /// GET /patrimoine/groupes — voir [WorkflowGroupeModel] (schéma déduit,
  /// non re-confirmé par un exemple JSON réel de Seven).
  Future<Result<List<WorkflowGroupeModel>>> getGroupes();

  /// GET /patrimoine/etapes — voir [WorkflowEtapeModel] (même réserve).
  Future<Result<List<WorkflowEtapeModel>>> getEtapes();

  /// GET /patrimoine/kpi/alertes — ⚠️ aucun schéma de réponse documenté nulle
  /// part (ni par Seven, ni par la spec backend d'origine) : non implémenté
  /// côté [PatrimoineRepositoryImpl] tant qu'un exemple réel n'est pas fourni,
  /// pour ne pas deviner la forme des KPI.
  Future<Result<List<dynamic>>> getKpiAlertes();

  // ---------------------------------------------------------------------
  // Écriture — corps confirmés par la doc Seven (2026-09-15).
  // ---------------------------------------------------------------------

  /// POST /patrimoine/campagnes/:id/comptages — idempotent par
  /// `(campagne, immobilisationId, agent connecté)`. `409` si la campagne
  /// est clôturée → [CampagneClotureeException].
  Future<Result<ComptageModel>> validerComptage(String campagneId, ComptageInput input);

  /// PATCH /patrimoine/campagnes/:id/comptages/:comptageId
  Future<Result<ComptageModel>> corrigerComptage(String campagneId, String comptageId, ComptageInput input);

  /// POST /patrimoine/immobilisations/:id/photos — multipart/form-data
  /// (pas de JSON). `auteur` : penser à envoyer le nom de l'agent connecté.
  Future<Result<PhotoModel>> uploadPhoto(
    String immobilisationId, {
    required List<PhotoAEnvoyer> fichiers,
    String? titre,
    String? message,
    String? auteur,
  });

  /// POST /patrimoine/dossiers — entre directement dans le circuit (pas de
  /// brouillon côté mobile).
  Future<Result<DossierModel>> creerDossier(DossierInput input);

  /// PATCH /patrimoine/dossiers/:id
  Future<Result<DossierModel>> modifierDossier(String id, DossierInput input);

  /// POST /patrimoine/dossiers/:id/validations — upsert par
  /// `(dossier, groupeId, role)`. ⚠️ Pas de garde anti-double-validation
  /// côté backend (voir [ValidationInput]).
  Future<Result<DossierModel>> validerDossier(String dossierId, ValidationInput input);

  /// POST /patrimoine/dossiers/:id/offres — avance à l'étape `consult`.
  Future<Result<DossierModel>> ajouterOffre(String dossierId, OffreInput input);

  /// PATCH /patrimoine/dossiers/:id/offres/:offreId/selectionner — pas de
  /// body. Avance à l'étape `bc`.
  Future<Result<DossierModel>> selectionnerOffre(String dossierId, String offreId);

  /// POST /patrimoine/dossiers/:id/livraisons — avance à l'étape `bl`.
  Future<Result<DossierModel>> ajouterLivraison(String dossierId, LivraisonInput input);

  /// POST /patrimoine/dossiers/:id/qualification — avance à l'étape `qualif`.
  Future<Result<DossierModel>> qualifierDossier(String dossierId, Qualification qualification);

  /// POST /patrimoine/dossiers/:id/generer-immobilisations — `quantite`
  /// défaut 1 (1-500) si omis. Avance à l'étape `immo`.
  ///
  /// ⚠️ Réponse confirmée par appel réel : `{ data: { immobilisationIds:
  /// [...] } }` — **pas** le dossier mis à jour (contrairement aux autres
  /// endpoints d'écriture du circuit) ; Seven n'avait documenté que le
  /// corps de requête, pas la réponse. Note aussi : `immobilisationIds` est
  /// en camelCase dans cette réponse, seule exception observée à la
  /// convention snake_case des réponses Patrimoine.
  Future<Result<List<String>>> genererImmobilisations(String dossierId, {int? quantite});

  /// POST /patrimoine/dossiers/:id/sortie — `409 DOSSIER_HORS_GROUPE_SORTIE`
  /// si le dossier n'appartient pas au groupe `sortie` →
  /// [DossierHorsGroupeSortieException]. Avance à l'étape `sortie`.
  Future<Result<DossierModel>> declarerSortie(String dossierId, SortieInput input);
}
