import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribution_model.freezed.dart';
part 'attribution_model.g.dart';

/// `immobilisation_attributions` — un mouvement de détenteur/emplacement.
@freezed
class AttributionModel with _$AttributionModel {
  const factory AttributionModel({
    required String id,
    required DateTime date,
    required String detenteur,
    required String lieu,
    required String motif,
    required String acteReference,
  }) = _AttributionModel;

  factory AttributionModel.fromJson(Map<String, dynamic> json) => _$AttributionModelFromJson(json);
}
