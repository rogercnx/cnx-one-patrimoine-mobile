// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributionModelImpl _$$AttributionModelImplFromJson(
  Map<String, dynamic> json,
) => _$AttributionModelImpl(
  id: json['id'] as String,
  date: DateTime.parse(json['date'] as String),
  detenteur: json['detenteur'] as String,
  lieu: json['lieu'] as String,
  motif: json['motif'] as String,
  acteReference: json['acteReference'] as String,
);

Map<String, dynamic> _$$AttributionModelImplToJson(
  _$AttributionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'detenteur': instance.detenteur,
  'lieu': instance.lieu,
  'motif': instance.motif,
  'acteReference': instance.acteReference,
};
