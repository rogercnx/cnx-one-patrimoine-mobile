import 'package:freezed_annotation/freezed_annotation.dart';

import 'immobilisation_enums.dart';

part 'comptage_model.freezed.dart';
part 'comptage_model.g.dart';

/// Correction éventuelle saisie pendant le comptage (sous-ensemble modifié
/// de la fiche). Un champ non nul signale un écart par rapport au registre.
@freezed
class ComptageModification with _$ComptageModification {
  const factory ComptageModification({
    EtatBien? etat,
    String? siteId,
    String? local,
    String? affectataire,
  }) = _ComptageModification;

  factory ComptageModification.fromJson(Map<String, dynamic> json) => _$ComptageModificationFromJson(json);
}

/// `inventaire_comptages` — un scan/pointage effectué pendant une campagne.
@freezed
class ComptageModel with _$ComptageModel {
  const factory ComptageModel({
    required String immobilisationId,
    required ResultatComptage resultat,
    required DateTime dateHeure,
    required String agentNom,
    String? note,
    ComptageModification? modification,
  }) = _ComptageModel;

  factory ComptageModel.fromJson(Map<String, dynamic> json) => _$ComptageModelFromJson(json);
}
