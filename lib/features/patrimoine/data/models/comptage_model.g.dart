// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comptage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComptageModelImpl _$$ComptageModelImplFromJson(Map<String, dynamic> json) =>
    _$ComptageModelImpl(
      id: json['id'] as String,
      campagneId: json['campagne_id'] as String,
      immobilisationId: json['immobilisation_id'] as String,
      agentId: json['agent_id'] as String,
      resultat: $enumDecode(_$ResultatInventaireEnumMap, json['resultat']),
      dateHeure: DateTime.parse(json['date_heure'] as String),
      etatConstate: $enumDecodeNullable(
        _$EtatBienEnumMap,
        json['etat_constate'],
      ),
      siteConstate: json['site_constate'] as String?,
      affectataireConstate: json['affectataire_constate'] as String?,
      note: json['note'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      zoneId: json['zone_id'] as String?,
      majCorrections: json['maj_corrections'],
    );

Map<String, dynamic> _$$ComptageModelImplToJson(_$ComptageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campagne_id': instance.campagneId,
      'immobilisation_id': instance.immobilisationId,
      'agent_id': instance.agentId,
      'resultat': _$ResultatInventaireEnumMap[instance.resultat]!,
      'date_heure': instance.dateHeure.toIso8601String(),
      'etat_constate': _$EtatBienEnumMap[instance.etatConstate],
      'site_constate': instance.siteConstate,
      'affectataire_constate': instance.affectataireConstate,
      'note': instance.note,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'zone_id': instance.zoneId,
      'maj_corrections': instance.majCorrections,
    };

const _$ResultatInventaireEnumMap = {
  ResultatInventaire.ok: 'ok',
  ResultatInventaire.ecart: 'ecart',
  ResultatInventaire.introuvable: 'introuvable',
};

const _$EtatBienEnumMap = {
  EtatBien.neuf: 'neuf',
  EtatBien.bon: 'bon',
  EtatBien.moyen: 'moyen',
  EtatBien.degrade: 'degrade',
  EtatBien.horsService: 'horsservice',
};
