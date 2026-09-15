// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidationInputImpl _$$ValidationInputImplFromJson(
  Map<String, dynamic> json,
) => _$ValidationInputImpl(
  groupeId: $enumDecode(_$GroupeIdEnumMap, json['groupeId']),
  role: $enumDecode(_$RoleValidationEnumMap, json['role']),
  statut: $enumDecode(_$StatutValidationEnumMap, json['statut']),
);

Map<String, dynamic> _$$ValidationInputImplToJson(
  _$ValidationInputImpl instance,
) => <String, dynamic>{
  'groupeId': _$GroupeIdEnumMap[instance.groupeId]!,
  'role': _$RoleValidationEnumMap[instance.role]!,
  'statut': _$StatutValidationEnumMap[instance.statut]!,
};

const _$GroupeIdEnumMap = {
  GroupeId.cmd: 'cmd',
  GroupeId.ach: 'ach',
  GroupeId.cpta: 'cpta',
  GroupeId.sortie: 'sortie',
};

const _$RoleValidationEnumMap = {
  RoleValidation.maker: 'maker',
  RoleValidation.controleur: 'controleur',
  RoleValidation.autorisation: 'autorisation',
};

const _$StatutValidationEnumMap = {
  StatutValidation.ok: 'ok',
  StatutValidation.attente: 'attente',
};
