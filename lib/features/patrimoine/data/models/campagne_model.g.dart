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
      dateDebut: DateTime.parse(json['date_debut'] as String),
      dateFin: json['date_fin'] == null
          ? null
          : DateTime.parse(json['date_fin'] as String),
      perimetre: json['perimetre'] as String?,
      statut: $enumDecode(_$StatutCampagneEnumMap, json['statut']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      gel: json['gel'] as bool? ?? false,
      perimetreSiteId: json['perimetre_site_id'] as String?,
      responsable: json['responsable'] as String?,
    );

Map<String, dynamic> _$$CampagneModelImplToJson(_$CampagneModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'libelle': instance.libelle,
      'date_debut': instance.dateDebut.toIso8601String(),
      'date_fin': instance.dateFin?.toIso8601String(),
      'perimetre': instance.perimetre,
      'statut': _$StatutCampagneEnumMap[instance.statut]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'gel': instance.gel,
      'perimetre_site_id': instance.perimetreSiteId,
      'responsable': instance.responsable,
    };

const _$StatutCampagneEnumMap = {
  StatutCampagne.enCours: 'en_cours',
  StatutCampagne.cloturee: 'cloturee',
};
