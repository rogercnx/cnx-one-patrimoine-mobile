import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converters.dart';

part 'site_model.freezed.dart';
part 'site_model.g.dart';

/// `sites` — confirmé par appel réel documenté par Seven (2026-09-15) :
/// `latitude`/`longitude` arrivent en JSON comme des **chaînes**
/// (`"0.390002"`), pas des nombres.
@freezed
class SiteModel with _$SiteModel {
  const factory SiteModel({
    required String id,
    required String code,
    required String nom,
    required String ville,
    @JsonKey(fromJson: parseFlexibleDouble) required double latitude,
    @JsonKey(fromJson: parseFlexibleDouble) required double longitude,
    // Nullable : présents sur toutes les réponses réelles mais non fournis
    // par les données mock existantes (non exploités par l'UI aujourd'hui).
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SiteModel;

  factory SiteModel.fromJson(Map<String, dynamic> json) => _$SiteModelFromJson(json);
}
