import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

import '../../../core/error/result.dart';
import '../../../core/network/network_exceptions.dart';
import '../domain/patrimoine_repository.dart';
import '../domain/photo_transport.dart';
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
import 'models/paginated_result_model.dart';
import 'models/patrimoine_enums.dart';
import 'models/photo_model.dart';
import 'models/site_model.dart';
import 'models/sortie_input_model.dart';
import 'models/validation_input_model.dart';
import 'models/workflow_etape_model.dart';
import 'models/workflow_groupe_model.dart';

/// Implémentation réelle de [PatrimoineRepository] contre `backend.zira24.com`.
///
/// Schémas confirmés par la doc Seven (2026-09-15, schémas Patrimoine) :
/// enveloppe `{data: T}`/`{data: T[]}` partout sauf `GET /immobilisations`
/// (`total`/`page`/`limit` à la racine, seule route paginée) ; requêtes
/// d'écriture en camelCase, réponses en snake_case ; `X-API-Key` requis en
/// prod (voir `ApiKeyInterceptor`).
///
/// Câblée dans `patrimoineRepositoryProvider` depuis la validation manuelle
/// du 2026-09-15 (lecture + comptage testés en conditions réelles sur
/// `dev-seeg`, voir CLAUDE.md section 3.2). `PatrimoineRepositoryMock` reste
/// disponible pour les tests unitaires, mais n'est plus l'implémentation
/// active.
///
/// `getAgentConnecte`/`getComptagesSession`/`enregistrerComptageSession`/
/// `getAffectatairesPossibles`/`getLocauxDuSite` ont été retirés de
/// l'interface (décision produit actée, CLAUDE.md section 4) : plus aucun
/// état/registre propre à Patrimoine sans route backend documentée.
/// [getKpiAlertes] : aucun schéma de réponse documenté nulle part → laissé
/// en [_pasEncoreImplemente] plutôt que d'inventer une forme de KPI.
class PatrimoineRepositoryImpl implements PatrimoineRepository {
  PatrimoineRepositoryImpl(this._dio);

  final Dio _dio;

  Map<String, dynamic> _objet(Response<dynamic> response) => (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;

  List<dynamic> _liste(Response<dynamic> response) => ((response.data as Map<String, dynamic>)['data'] as List?) ?? const [];

  // ---------------------------------------------------------------------
  // Lecture
  // ---------------------------------------------------------------------

  @override
  Future<Result<List<SiteModel>>> getSites() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/sites');
      return Success(_liste(response).map((e) => SiteModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
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
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/patrimoine/immobilisations',
        queryParameters: {
          'page': page,
          'limit': limit,
          'site': ?siteId,
          'statut': ?statut?.name,
          'etat': ?etat?.wireValue,
          'categorie': ?categorie,
          'q': ?q,
        },
      );
      final paginated = PaginatedResult<ImmobilisationModel>.fromJson(
        response.data ?? const {},
        (json) => ImmobilisationModel.fromJson(json as Map<String, dynamic>),
      );
      return Success(paginated.data);
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<ImmobilisationModel>> getImmobilisation(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/immobilisations/$id');
      return Success(ImmobilisationModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<EntretienModel>>> getEntretiens(String immobilisationId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/immobilisations/$immobilisationId/entretiens');
      return Success(_liste(response).map((e) => EntretienModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<AttributionModel>>> getAttributions(String immobilisationId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/immobilisations/$immobilisationId/attributions');
      return Success(_liste(response).map((e) => AttributionModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<PhotoModel>>> getPhotos(String immobilisationId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/immobilisations/$immobilisationId/photos');
      return Success(_liste(response).map((e) => PhotoModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<FichierBinaire>> getPhotoFichierContent({
    required String immobilisationId,
    required String photoId,
    required String fichierId,
  }) async {
    try {
      final response = await _dio.get<List<int>>(
        '/patrimoine/immobilisations/$immobilisationId/photos/$photoId/fichiers/$fichierId/content',
        options: Options(responseType: ResponseType.bytes),
      );
      final contentType = response.headers.value('content-type') ?? 'application/octet-stream';
      return Success(FichierBinaire(bytes: Uint8List.fromList(response.data ?? const []), contentType: contentType));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<ComptageModel>>> getComptagesReels(String campagneId, {String? agentId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/patrimoine/campagnes/$campagneId/comptages',
        queryParameters: {'agent_id': ?agentId},
      );
      return Success(_liste(response).map((e) => ComptageModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<CampagneModel>> getCampagneEnCours() async {
    // Pas de `getCampagnes()` générique dans l'interface — mappé sur
    // GET /patrimoine/campagnes (même enveloppe `{data: [...]}` confirmée),
    // puis filtré côté client sur le statut déjà modélisé (`StatutCampagne`).
    // Convention actée — voir CLAUDE.md section 4. Filtre `statut` confirmé
    // par la doc Seven (§4) : appliqué côté serveur pour éviter de tout
    // récupérer, le filtre client reste le garde-fou (choix parmi plusieurs
    // résultats, ou absence).
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/campagnes', queryParameters: {'statut': 'en_cours'});
      final campagnes = _liste(response).map((e) => CampagneModel.fromJson(e as Map<String, dynamic>)).toList();
      final enCours = campagnes.firstWhereOrNull((c) => c.statut == StatutCampagne.enCours);
      if (enCours == null) {
        return const Failure(NotFoundException('Aucune campagne en cours.'));
      }
      return Success(enCours);
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<DossierModel>>> getDossiers({GroupeId? groupe, EtapeId? etape, String? site, String? departement, bool? alerte}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/patrimoine/dossiers',
        queryParameters: {
          'groupe': ?groupe?.name,
          'etape': ?etape?.name,
          'site': ?site,
          'departement': ?departement,
          'alerte': ?alerte,
        },
      );
      return Success(_liste(response).map((e) => DossierModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> getDossier(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/dossiers/$id');
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<WorkflowGroupeModel>>> getGroupes() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/groupes');
      return Success(_liste(response).map((e) => WorkflowGroupeModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<WorkflowEtapeModel>>> getEtapes() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/etapes');
      return Success(_liste(response).map((e) => WorkflowEtapeModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<dynamic>>> getKpiAlertes() => _pasEncoreImplemente();

  // ---------------------------------------------------------------------
  // Écriture
  // ---------------------------------------------------------------------

  @override
  Future<Result<ComptageModel>> validerComptage(String campagneId, ComptageInput input) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/campagnes/$campagneId/comptages', data: input.toJson());
      return Success(ComptageModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) return const Failure(CampagneClotureeException());
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<ComptageModel>> corrigerComptage(String campagneId, String comptageId, ComptageInput input) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>('/patrimoine/campagnes/$campagneId/comptages/$comptageId', data: input.toJson());
      return Success(ComptageModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) return const Failure(CampagneClotureeException());
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<PhotoModel>> uploadPhoto(
    String immobilisationId, {
    required List<PhotoAEnvoyer> fichiers,
    String? titre,
    String? message,
    String? auteur,
  }) async {
    try {
      final formData = FormData.fromMap({
        'titre': ?titre,
        'message': ?message,
        'auteur': ?auteur,
        for (final (i, f) in fichiers.indexed)
          'fichier$i': MultipartFile.fromBytes(f.bytes, filename: f.nomFichier, contentType: f.mimeType == null ? null : DioMediaType.parse(f.mimeType!)),
      });
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/immobilisations/$immobilisationId/photos', data: formData);
      return Success(PhotoModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> creerDossier(DossierInput input) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/dossiers', data: input.toJson());
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> modifierDossier(String id, DossierInput input) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>('/patrimoine/dossiers/$id', data: input.toJson());
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> validerDossier(String dossierId, ValidationInput input) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/dossiers/$dossierId/validations', data: input.toJson());
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> ajouterOffre(String dossierId, OffreInput input) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/dossiers/$dossierId/offres', data: input.toJson());
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> selectionnerOffre(String dossierId, String offreId) async {
    try {
      // Pas de body — Seven le précise explicitement.
      final response = await _dio.patch<Map<String, dynamic>>('/patrimoine/dossiers/$dossierId/offres/$offreId/selectionner');
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> ajouterLivraison(String dossierId, LivraisonInput input) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/dossiers/$dossierId/livraisons', data: input.toJson());
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> qualifierDossier(String dossierId, Qualification qualification) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/patrimoine/dossiers/$dossierId/qualification',
        data: {'qualification': qualification.name},
      );
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<String>>> genererImmobilisations(String dossierId, {int? quantite}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/patrimoine/dossiers/$dossierId/generer-immobilisations',
        data: {'quantite': ?quantite},
      );
      // Réponse confirmée par appel réel : {data: {immobilisationIds: [...]}}
      // (camelCase, pas le dossier — voir doc de l'interface).
      final ids = (_objet(response)['immobilisationIds'] as List).cast<String>();
      return Success(ids);
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<DossierModel>> declarerSortie(String dossierId, SortieInput input) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/patrimoine/dossiers/$dossierId/sortie', data: input.toJson());
      return Success(DossierModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) return const Failure(DossierHorsGroupeSortieException());
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<List<CampagneModel>>> getCampagnesCloturees() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/campagnes', queryParameters: {'statut': 'cloturee'});
      return Success(_liste(response).map((e) => CampagneModel.fromJson(e as Map<String, dynamic>)).toList());
    } on DioException catch (e) {
      return Failure(mapDioException(e));
    }
  }

  @override
  Future<Result<ImmobilisationModel?>> resoudreCode(String code) async {
    // Schéma de réponse non documenté par Seven — supposé aligné sur la
    // convention générale `{data: Immobilisation}`, testé en conditions
    // réelles (voir CLAUDE.md section 3.2). 404 traité comme "non trouvé",
    // pas comme une erreur (cf. doc de l'interface).
    try {
      final response = await _dio.get<Map<String, dynamic>>('/patrimoine/lookup/qr/$code');
      return Success(ImmobilisationModel.fromJson(_objet(response)));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const Success(null);
      return Failure(mapDioException(e));
    }
  }

  Never _pasEncoreImplemente() => throw UnimplementedError(
        'PatrimoineRepositoryImpl : méthode UI-only sans route backend documentée, '
        'ou schéma non confirmé (voir doc de classe).',
      );
}
