import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribution_model.freezed.dart';
part 'attribution_model.g.dart';

/// `immobilisation_attributions` — un mouvement de détenteur/emplacement.
///
/// Colonnes reprises de CLAUDE.md section 3.1 (spec backend d'origine) et
/// de la convention snake_case confirmée par la doc Seven — pas d'exemple
/// JSON réel spécifique fourni pour cette entité (`GET
/// /immobilisations/:id/attributions` n'a pas été exemplifié).
@freezed
class AttributionModel with _$AttributionModel {
  const factory AttributionModel({
    required String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    required DateTime date,
    required String detenteur,
    required String lieu,
    required String motif,
    @JsonKey(name: 'acte_reference') required String acteReference,
  }) = _AttributionModel;

  factory AttributionModel.fromJson(Map<String, dynamic> json) => _$AttributionModelFromJson(json);
}
