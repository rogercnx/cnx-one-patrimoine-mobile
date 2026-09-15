import 'package:freezed_annotation/freezed_annotation.dart';

import 'immobilisation_enums.dart';
import 'patrimoine_enums.dart';

part 'comptage_model.freezed.dart';
part 'comptage_model.g.dart';

/// `inventaire_comptages` — modèle de **lecture réelle**, confirmé par
/// exemple JSON dans la doc Seven (2026-09-15) : renvoyé par `POST`/`PATCH
/// .../comptages(/:comptageId)` (enveloppe `{data: Comptage}`). `zone_id` et
/// `maj_corrections` sont des colonnes additives récentes (toujours `null`
/// observé côté mobile) — `maj_corrections` est laissé en `dynamic`, son
/// type exact n'étant précisé nulle part.
///
/// Distinct de [ComptageSessionEntry] (`comptage_session_entry_model.dart`),
/// qui reste le modèle UI-only utilisé par l'écran Fiche détail en mode mock
/// (comptage local avant tout appel réseau, avec sous-cas d'écart pour
/// l'affichage) — les deux ne se recouvrent pas.
@freezed
class ComptageModel with _$ComptageModel {
  const factory ComptageModel({
    required String id,
    @JsonKey(name: 'campagne_id') required String campagneId,
    @JsonKey(name: 'immobilisation_id') required String immobilisationId,
    @JsonKey(name: 'agent_id') required String agentId,
    required ResultatInventaire resultat,
    @JsonKey(name: 'date_heure') required DateTime dateHeure,
    @JsonKey(name: 'etat_constate') EtatBien? etatConstate,
    @JsonKey(name: 'site_constate') String? siteConstate,
    @JsonKey(name: 'affectataire_constate') String? affectataireConstate,
    String? note,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'zone_id') String? zoneId,
    @JsonKey(name: 'maj_corrections') dynamic majCorrections,
  }) = _ComptageModel;

  factory ComptageModel.fromJson(Map<String, dynamic> json) => _$ComptageModelFromJson(json);
}
