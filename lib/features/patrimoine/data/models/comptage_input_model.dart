import 'package:freezed_annotation/freezed_annotation.dart';

import 'immobilisation_enums.dart';
import 'patrimoine_enums.dart';

part 'comptage_input_model.freezed.dart';
part 'comptage_input_model.g.dart';

/// Corps de `POST /campagnes/:id/comptages` et `PATCH
/// /campagnes/:id/comptages/:comptageId` — confirmé par la doc Seven
/// (2026-09-15). Requêtes en **camelCase** (contrairement aux réponses,
/// en snake_case — asymétrie confirmée par Seven, voir CLAUDE.md).
///
/// Un seul modèle pour les deux appels : tous les champs sont nullable ici,
/// mais `immobilisationId`/`resultat` sont **requis par le backend** à la
/// création (`POST`) — c'est à l'appelant de les fournir dans ce cas ;
/// `PATCH` accepte n'importe quel sous-ensemble. `includeIfNull: false`
/// pour ne jamais envoyer un champ omis comme `null` explicite (écraserait
/// une valeur existante lors d'une correction partielle).
@freezed
class ComptageInput with _$ComptageInput {
  const factory ComptageInput({
    @JsonKey(includeIfNull: false) String? immobilisationId,
    @JsonKey(includeIfNull: false) ResultatInventaire? resultat,
    @JsonKey(includeIfNull: false) EtatBien? etatConstate,
    @JsonKey(includeIfNull: false) String? siteConstate,
    @JsonKey(includeIfNull: false) String? affectataireConstate,
    @JsonKey(includeIfNull: false) String? note,
  }) = _ComptageInput;

  factory ComptageInput.fromJson(Map<String, dynamic> json) => _$ComptageInputFromJson(json);
}
