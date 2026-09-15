import 'package:freezed_annotation/freezed_annotation.dart';

import 'immobilisation_enums.dart';
import 'patrimoine_enums.dart';

part 'dossier_input_model.freezed.dart';
part 'dossier_input_model.g.dart';

/// Corps de `POST /dossiers` et `PATCH /dossiers/:id` — confirmé par la doc
/// Seven (2026-09-15). Requêtes en camelCase. Un seul modèle pour les deux
/// appels (tous champs nullable) : `objet`/`famille` sont **requis par le
/// backend** à la création — à l'appelant de les fournir dans ce cas.
/// `bonCommandeRef`/`factureRef`/`alerte` ne sont documentés que côté
/// `PATCH` par Seven, mais rien n'interdit de les envoyer à la création.
/// `includeIfNull: false` : ne jamais écraser un champ omis avec `null`.
@freezed
class DossierInput with _$DossierInput {
  const factory DossierInput({
    @JsonKey(includeIfNull: false) GroupeId? groupeId,
    @JsonKey(includeIfNull: false) String? siteId,
    @JsonKey(includeIfNull: false) String? objet,
    @JsonKey(includeIfNull: false) String? categorie,
    @JsonKey(includeIfNull: false) FamilleImmobilisation? famille,
    @JsonKey(includeIfNull: false) String? departement,
    @JsonKey(includeIfNull: false) double? montant,
    @JsonKey(includeIfNull: false) double? budgetPrevu,
    @JsonKey(includeIfNull: false) String? compteComptable,
    @JsonKey(includeIfNull: false) String? fournisseur,
    @JsonKey(includeIfNull: false) String? bonCommandeRef,
    @JsonKey(includeIfNull: false) String? factureRef,
    @JsonKey(includeIfNull: false) String? alerte,
  }) = _DossierInput;

  factory DossierInput.fromJson(Map<String, dynamic> json) => _$DossierInputFromJson(json);
}
