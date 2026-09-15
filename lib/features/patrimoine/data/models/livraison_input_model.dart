import 'package:freezed_annotation/freezed_annotation.dart';

part 'livraison_input_model.freezed.dart';
part 'livraison_input_model.g.dart';

/// Corps de `POST /dossiers/:id/livraisons` — confirmé par la doc Seven
/// (2026-09-15). `reference`/`quantiteRecue` requis. Requête en camelCase.
/// `includeIfNull: false` pour omettre `commentaire` si non fourni.
@freezed
class LivraisonInput with _$LivraisonInput {
  const factory LivraisonInput({
    required String reference,
    required int quantiteRecue,
    @JsonKey(includeIfNull: false) String? commentaire,
  }) = _LivraisonInput;

  factory LivraisonInput.fromJson(Map<String, dynamic> json) => _$LivraisonInputFromJson(json);
}
