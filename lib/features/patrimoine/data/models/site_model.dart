import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_model.freezed.dart';
part 'site_model.g.dart';

@freezed
class SiteModel with _$SiteModel {
  const factory SiteModel({
    required String id,
    required String code,
    required String nom,
    required String ville,
    required double latitude,
    required double longitude,
  }) = _SiteModel;

  factory SiteModel.fromJson(Map<String, dynamic> json) => _$SiteModelFromJson(json);
}
