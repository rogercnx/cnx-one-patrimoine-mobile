// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributionModelImpl _$$AttributionModelImplFromJson(
  Map<String, dynamic> json,
) => _$AttributionModelImpl(
  id: json['id'] as String,
  immobilisationId: json['immobilisation_id'] as String?,
  date: DateTime.parse(json['date'] as String),
  detenteur: json['detenteur'] as String,
  lieu: json['lieu'] as String,
  motif: json['motif'] as String,
  acteReference: json['acte_reference'] as String,
);

Map<String, dynamic> _$$AttributionModelImplToJson(
  _$AttributionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'immobilisation_id': instance.immobilisationId,
  'date': instance.date.toIso8601String(),
  'detenteur': instance.detenteur,
  'lieu': instance.lieu,
  'motif': instance.motif,
  'acte_reference': instance.acteReference,
};
