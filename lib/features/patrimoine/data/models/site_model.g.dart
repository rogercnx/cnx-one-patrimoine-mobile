// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteModelImpl _$$SiteModelImplFromJson(Map<String, dynamic> json) =>
    _$SiteModelImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      nom: json['nom'] as String,
      ville: json['ville'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$SiteModelImplToJson(_$SiteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'nom': instance.nom,
      'ville': instance.ville,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
