import 'package:freezed_annotation/freezed_annotation.dart';

import 'comptage_model.dart';

part 'campagne_historique_model.freezed.dart';
part 'campagne_historique_model.g.dart';

/// Contribution d'un agent à une campagne clôturée.
@freezed
class ContributionAgentModel with _$ContributionAgentModel {
  const factory ContributionAgentModel({
    required String nom,
    required int biensComptes,
    required int ecarts,
  }) = _ContributionAgentModel;

  factory ContributionAgentModel.fromJson(Map<String, dynamic> json) => _$ContributionAgentModelFromJson(json);
}

/// Résumé d'une campagne d'inventaire clôturée, pour l'onglet "Historique".
@freezed
class CampagneHistoriqueModel with _$CampagneHistoriqueModel {
  const factory CampagneHistoriqueModel({
    required String reference,
    required String libelle,
    required String periodeLabel,
    required int totalBiens,
    required int biensComptes,
    required int ecarts,
    required int introuvables,
    @Default([]) List<ContributionAgentModel> contributions,
    @Default([]) List<ComptageModel> mouvements,
  }) = _CampagneHistoriqueModel;

  factory CampagneHistoriqueModel.fromJson(Map<String, dynamic> json) => _$CampagneHistoriqueModelFromJson(json);
}
