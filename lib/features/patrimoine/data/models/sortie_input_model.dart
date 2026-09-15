import 'package:freezed_annotation/freezed_annotation.dart';

import 'patrimoine_enums.dart';

part 'sortie_input_model.freezed.dart';
part 'sortie_input_model.g.dart';

/// Un élément de `justificatifs` dans [SortieInput].
@freezed
class JustificatifInput with _$JustificatifInput {
  const factory JustificatifInput({
    required String libelle,
    required StatutJustificatif statut,
  }) = _JustificatifInput;

  factory JustificatifInput.fromJson(Map<String, dynamic> json) => _$JustificatifInputFromJson(json);
}

/// Corps de `POST /dossiers/:id/sortie` — confirmé par la doc Seven
/// (2026-09-15). `motif` requis, `justificatifs` optionnel. Requête en
/// camelCase.
///
/// ⚠️ `409 DOSSIER_HORS_GROUPE_SORTIE` si le dossier n'appartient pas au
/// groupe `sortie` — cette route n'en crée pas un nouveau, elle agit sur un
/// dossier de sortie déjà existant (voir [DossierHorsGroupeSortieException]).
@freezed
class SortieInput with _$SortieInput {
  const factory SortieInput({
    required MotifSortie motif,
    @JsonKey(includeIfNull: false) List<JustificatifInput>? justificatifs,
  }) = _SortieInput;

  factory SortieInput.fromJson(Map<String, dynamic> json) => _$SortieInputFromJson(json);
}
