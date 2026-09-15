// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comptage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComptageModificationImpl _$$ComptageModificationImplFromJson(
  Map<String, dynamic> json,
) => _$ComptageModificationImpl(
  etat: $enumDecodeNullable(_$EtatBienEnumMap, json['etat']),
  siteId: json['siteId'] as String?,
  local: json['local'] as String?,
  affectataire: json['affectataire'] as String?,
);

Map<String, dynamic> _$$ComptageModificationImplToJson(
  _$ComptageModificationImpl instance,
) => <String, dynamic>{
  'etat': _$EtatBienEnumMap[instance.etat],
  'siteId': instance.siteId,
  'local': instance.local,
  'affectataire': instance.affectataire,
};

const _$EtatBienEnumMap = {
  EtatBien.neuf: 'neuf',
  EtatBien.bon: 'bon',
  EtatBien.moyen: 'moyen',
  EtatBien.degrade: 'degrade',
  EtatBien.horsService: 'horsservice',
};

_$ComptageModelImpl _$$ComptageModelImplFromJson(Map<String, dynamic> json) =>
    _$ComptageModelImpl(
      immobilisationId: json['immobilisationId'] as String,
      resultat: $enumDecode(_$ResultatComptageEnumMap, json['resultat']),
      dateHeure: DateTime.parse(json['dateHeure'] as String),
      agentNom: json['agentNom'] as String,
      note: json['note'] as String?,
      modification: json['modification'] == null
          ? null
          : ComptageModification.fromJson(
              json['modification'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ComptageModelImplToJson(_$ComptageModelImpl instance) =>
    <String, dynamic>{
      'immobilisationId': instance.immobilisationId,
      'resultat': _$ResultatComptageEnumMap[instance.resultat]!,
      'dateHeure': instance.dateHeure.toIso8601String(),
      'agentNom': instance.agentNom,
      'note': instance.note,
      'modification': instance.modification,
    };

const _$ResultatComptageEnumMap = {
  ResultatComptage.ok: 'ok',
  ResultatComptage.etat: 'etat',
  ResultatComptage.lieu: 'lieu',
  ResultatComptage.affect: 'affect',
  ResultatComptage.introuvable: 'introuvable',
};
