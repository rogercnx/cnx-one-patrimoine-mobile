import 'package:freezed_annotation/freezed_annotation.dart';

part 'offre_input_model.freezed.dart';
part 'offre_input_model.g.dart';

/// Corps de `POST /dossiers/:id/offres` — confirmé par la doc Seven
/// (2026-09-15). `fournisseur` requis, le reste optionnel. Requête en
/// camelCase. `includeIfNull: false` pour omettre les champs non fournis.
@freezed
class OffreInput with _$OffreInput {
  const factory OffreInput({
    required String fournisseur,
    @JsonKey(includeIfNull: false) double? montant,
    @JsonKey(includeIfNull: false) String? delai,
    @JsonKey(includeIfNull: false) String? observation,
  }) = _OffreInput;

  factory OffreInput.fromJson(Map<String, dynamic> json) => _$OffreInputFromJson(json);
}
