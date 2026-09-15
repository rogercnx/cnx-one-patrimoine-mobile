import 'package:freezed_annotation/freezed_annotation.dart';

part 'entretien_model.freezed.dart';
part 'entretien_model.g.dart';

/// `immobilisation_entretiens` — une intervention d'entretien sur un bien.
@freezed
class EntretienModel with _$EntretienModel {
  const factory EntretienModel({
    required String id,
    required DateTime date,
    required String titre,
    required double cout,
    required String prestataire,
    String? observation,
    String? bonCommandeRef,
    String? bonLivraisonRef,
    String? factureRef,
    String? dossierRef,
    String? dureeIntervention,
    String? technicien,
  }) = _EntretienModel;

  factory EntretienModel.fromJson(Map<String, dynamic> json) => _$EntretienModelFromJson(json);
}
