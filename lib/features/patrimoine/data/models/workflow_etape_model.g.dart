// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_etape_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowEtapeModelImpl _$$WorkflowEtapeModelImplFromJson(
  Map<String, dynamic> json,
) => _$WorkflowEtapeModelImpl(
  id: $enumDecode(_$EtapeIdEnumMap, json['id']),
  groupeId: $enumDecode(_$GroupeIdEnumMap, json['groupe_id']),
  labelCourt: json['label_court'] as String?,
  label: json['label'] as String,
  icone: json['icone'] as String?,
  ordre: (json['ordre'] as num?)?.toInt(),
);

Map<String, dynamic> _$$WorkflowEtapeModelImplToJson(
  _$WorkflowEtapeModelImpl instance,
) => <String, dynamic>{
  'id': _$EtapeIdEnumMap[instance.id]!,
  'groupe_id': _$GroupeIdEnumMap[instance.groupeId]!,
  'label_court': instance.labelCourt,
  'label': instance.label,
  'icone': instance.icone,
  'ordre': instance.ordre,
};

const _$EtapeIdEnumMap = {
  EtapeId.besoin: 'besoin',
  EtapeId.verif: 'verif',
  EtapeId.autor: 'autor',
  EtapeId.consult: 'consult',
  EtapeId.bc: 'bc',
  EtapeId.bl: 'bl',
  EtapeId.fact: 'fact',
  EtapeId.qualif: 'qualif',
  EtapeId.immo: 'immo',
  EtapeId.sortie: 'sortie',
};

const _$GroupeIdEnumMap = {
  GroupeId.cmd: 'cmd',
  GroupeId.ach: 'ach',
  GroupeId.cpta: 'cpta',
  GroupeId.sortie: 'sortie',
};
