// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campagne_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CampagneModelImpl _$$CampagneModelImplFromJson(Map<String, dynamic> json) =>
    _$CampagneModelImpl(
      id: json['id'] as String,
      reference: json['reference'] as String,
      libelle: json['libelle'] as String,
      dateDebut: DateTime.parse(json['dateDebut'] as String),
      dateFin: DateTime.parse(json['dateFin'] as String),
      perimetre: json['perimetre'] as String,
      statut: $enumDecode(_$StatutCampagneEnumMap, json['statut']),
      responsable: json['responsable'] as String,
    );

Map<String, dynamic> _$$CampagneModelImplToJson(_$CampagneModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'libelle': instance.libelle,
      'dateDebut': instance.dateDebut.toIso8601String(),
      'dateFin': instance.dateFin.toIso8601String(),
      'perimetre': instance.perimetre,
      'statut': _$StatutCampagneEnumMap[instance.statut]!,
      'responsable': instance.responsable,
    };

const _$StatutCampagneEnumMap = {
  StatutCampagne.enCours: 'en_cours',
  StatutCampagne.cloturee: 'cloturee',
};
