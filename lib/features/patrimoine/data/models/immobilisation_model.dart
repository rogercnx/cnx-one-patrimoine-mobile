import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribution_model.dart';
import 'entretien_model.dart';
import 'immobilisation_enums.dart';
import 'json_converters.dart';
import 'photo_model.dart';

part 'immobilisation_model.freezed.dart';
part 'immobilisation_model.g.dart';

/// `immobilisations` — fiche d'un bien du registre patrimonial.
///
/// Champs confirmés par exemple JSON réel dans la doc Seven (2026-09-15,
/// schémas Patrimoine) : tout est plat et en snake_case, `valeur_acquisition`
/// et `montant_amorti` arrivent en **string** (`"1066666.67"`), `departement`
/// et `dossier_id` sont deux colonnes additives récentes (nullable).
///
/// Champs nullable confirmés par appel réel (immobilisation générée depuis
/// un dossier minimal, sans site/fournisseur/montant renseignés en amont) :
/// `site_id`, `local`, `affectataire`, `fournisseur`, `bon_commande_ref`,
/// `compte_comptable`, `valeur_acquisition` peuvent être `null` — l'exemple
/// de Seven montrait un cas entièrement rempli, pas la nullabilité réelle.
///
/// [entretiens]/[attributions]/[photos] restent des champs de composition
/// côté app (défaut vide) : la vraie réponse de `GET /immobilisations(/:id)`
/// ne les inclut **pas** (confirmé — ce sont 3 endpoints séparés, voir
/// [PatrimoineRepository.getEntretiens]/[PatrimoineRepository.getAttributions]/
/// [PatrimoineRepository.getPhotos]). `PatrimoineRepositoryImpl.getImmobilisation`
/// les laisse donc à vide ; seul `PatrimoineRepositoryMock` les peuple pour la
/// démo. À adapter le jour où l'écran Fiche détail sera branché sur ces 3
/// endpoints séparés plutôt que sur ces champs nichés.
@freezed
class ImmobilisationModel with _$ImmobilisationModel {
  const ImmobilisationModel._();

  const factory ImmobilisationModel({
    required String id,
    required String code,
    required String designation,
    required String categorie,
    @JsonKey(name: 'compte_comptable') String? compteComptable,
    required FamilleImmobilisation famille,
    @JsonKey(name: 'site_id') String? siteId,
    String? local,
    String? affectataire,
    required StatutBien statut,
    required EtatBien etat,
    String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    @JsonKey(name: 'date_acquisition') required DateTime dateAcquisition,
    @JsonKey(name: 'valeur_acquisition', fromJson: parseFlexibleDoubleNullable) double? valeurAcquisition,
    @JsonKey(name: 'date_mise_service') DateTime? dateMiseService,
    @JsonKey(name: 'duree_amortissement') required int dureeAmortissement,
    @JsonKey(name: 'methode_amortissement') required MethodeAmortissement methodeAmortissement,
    @JsonKey(name: 'montant_amorti', fromJson: parseFlexibleDouble) required double montantAmorti,
    @JsonKey(name: 'date_dernier_inventaire') DateTime? dateDernierInventaire,
    @JsonKey(name: 'sortie_ref') String? sortieRef,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Additives (chantier web organisation, même table partagée) — nullable.
    String? departement,
    @JsonKey(name: 'dossier_id') String? dossierId,
    // Composition app, absents de la vraie réponse — voir doc de classe.
    @Default([]) List<EntretienModel> entretiens,
    @Default([]) List<AttributionModel> attributions,
    @Default([]) List<PhotoModel> photos,
  }) = _ImmobilisationModel;

  factory ImmobilisationModel.fromJson(Map<String, dynamic> json) => _$ImmobilisationModelFromJson(json);

  /// Valeur nette comptable = valeur d'acquisition − amortissement cumulé.
  double get valeurNetteComptable => (valeurAcquisition ?? 0) - montantAmorti;
}
