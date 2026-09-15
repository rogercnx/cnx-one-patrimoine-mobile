import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converters.dart';

part 'entretien_model.freezed.dart';
part 'entretien_model.g.dart';

/// `immobilisation_entretiens` — une intervention d'entretien sur un bien.
///
/// Colonnes reprises de CLAUDE.md section 3.1 (spec backend d'origine) et
/// de la convention snake_case confirmée par la doc Seven pour l'ensemble
/// de l'espace Patrimoine — mais Seven n'a pas fourni d'exemple JSON réel
/// spécifique à cette entité (`GET /immobilisations/:id/entretiens` n'a pas
/// été exemplifié). `cout` est traité avec le même parseur flexible
/// (string OU number) que les montants confirmés ailleurs, par prudence.
@freezed
class EntretienModel with _$EntretienModel {
  const factory EntretienModel({
    required String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    required DateTime date,
    required String titre,
    @JsonKey(fromJson: parseFlexibleDouble) required double cout,
    required String prestataire,
    String? observation,
    @JsonKey(name: 'bon_commande_ref') String? bonCommandeRef,
    @JsonKey(name: 'bon_livraison_ref') String? bonLivraisonRef,
    @JsonKey(name: 'facture_ref') String? factureRef,
    @JsonKey(name: 'dossier_ref') String? dossierRef,
    @JsonKey(name: 'duree_intervention') String? dureeIntervention,
    String? technicien,
  }) = _EntretienModel;

  factory EntretienModel.fromJson(Map<String, dynamic> json) => _$EntretienModelFromJson(json);
}
