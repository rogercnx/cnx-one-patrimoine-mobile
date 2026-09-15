// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoModelImpl _$$PhotoModelImplFromJson(Map<String, dynamic> json) =>
    _$PhotoModelImpl(
      id: json['id'] as String,
      immobilisationId: json['immobilisation_id'] as String?,
      date: DateTime.parse(json['date'] as String),
      titre: json['titre'] as String,
      message: json['message'] as String?,
      auteur: json['auteur'] as String,
      nombreFichiers: (json['nombreFichiers'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PhotoModelImplToJson(_$PhotoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'immobilisation_id': instance.immobilisationId,
      'date': instance.date.toIso8601String(),
      'titre': instance.titre,
      'message': instance.message,
      'auteur': instance.auteur,
      'nombreFichiers': instance.nombreFichiers,
    };
