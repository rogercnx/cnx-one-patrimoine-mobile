// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comptage_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComptageInputImpl _$$ComptageInputImplFromJson(
  Map<String, dynamic> json,
) => _$ComptageInputImpl(
  immobilisationId: json['immobilisationId'] as String?,
  resultat: $enumDecodeNullable(_$ResultatInventaireEnumMap, json['resultat']),
  etatConstate: $enumDecodeNullable(_$EtatBienEnumMap, json['etatConstate']),
  siteConstate: json['siteConstate'] as String?,
  affectataireConstate: json['affectataireConstate'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$$ComptageInputImplToJson(
  _$ComptageInputImpl instance,
) => <String, dynamic>{
  if (instance.immobilisationId case final value?) 'immobilisationId': value,
  if (_$ResultatInventaireEnumMap[instance.resultat] case final value?)
    'resultat': value,
  if (_$EtatBienEnumMap[instance.etatConstate] case final value?)
    'etatConstate': value,
  if (instance.siteConstate case final value?) 'siteConstate': value,
  if (instance.affectataireConstate case final value?)
    'affectataireConstate': value,
  if (instance.note case final value?) 'note': value,
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
