import 'package:freezed_annotation/freezed_annotation.dart';

import 'immobilisation_enums.dart';
import 'json_converters.dart';
import 'patrimoine_enums.dart';

part 'dossier_model.freezed.dart';
part 'dossier_model.g.dart';

/// `dossiers` — confirmé par exemple JSON réel dans la doc Seven
/// (2026-09-15) : `montant`/`budget_prevu` arrivent en **string**,
/// `date_demande` en date ISO. `etape_groupe_id`, `statut`, `rejet_motif`,
/// `fournisseur_id` sont des colonnes additives récentes. `statut` reste en
/// `String?` (pas d'enum) : seule la valeur `"en_cours"` (posée
/// automatiquement à la création côté mobile) est confirmée, le domaine
/// complet des valeurs possibles n'est pas documenté.
///
/// `site_id`/`montant` confirmés **nullable** par appel réel (`POST
/// /dossiers` avec seulement `objet`/`famille`/`categorie` — `site_id` et
/// `montant` restent `null` tant qu'ils ne sont pas renseignés) — l'exemple
/// de Seven montrait un dossier déjà complet, pas la nullabilité réelle.
@freezed
class DossierModel with _$DossierModel {
  const factory DossierModel({
    required String id,
    required String reference,
    @JsonKey(name: 'site_id') String? siteId,
    required String objet,
    String? categorie,
    required FamilleImmobilisation famille,
    String? departement,
    @JsonKey(name: 'demandeur_id') required String demandeurId,
    @JsonKey(name: 'date_demande') required DateTime dateDemande,
    @JsonKey(fromJson: parseFlexibleDoubleNullable) double? montant,
    @JsonKey(name: 'budget_prevu', fromJson: parseFlexibleDoubleNullable) double? budgetPrevu,
    @JsonKey(name: 'etape_courante_id') required EtapeId etapeCouranteId,
    Qualification? qualification,
    @JsonKey(name: 'compte_comptable') String? compteComptable,
    String? fournisseur,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    String? alerte,
    @JsonKey(name: 'immobilisations_generees') String? immobilisationsGenerees,
    @JsonKey(name: 'motif_sortie') MotifSortie? motifSortie,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Additives (chantier web organisation, même table partagée) — nullable.
    @JsonKey(name: 'etape_groupe_id') GroupeId? etapeGroupeId,
    String? statut,
    @JsonKey(name: 'rejet_motif') String? rejetMotif,
    @JsonKey(name: 'fournisseur_id') String? fournisseurId,
  }) = _DossierModel;

  factory DossierModel.fromJson(Map<String, dynamic> json) => _$DossierModelFromJson(json);
}
