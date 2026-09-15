// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_groupe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowGroupeModelImpl _$$WorkflowGroupeModelImplFromJson(
  Map<String, dynamic> json,
) => _$WorkflowGroupeModelImpl(
  id: $enumDecode(_$GroupeIdEnumMap, json['id']),
  label: json['label'] as String,
  icone: json['icone'] as String?,
  ordre: (json['ordre'] as num?)?.toInt(),
);

Map<String, dynamic> _$$WorkflowGroupeModelImplToJson(
  _$WorkflowGroupeModelImpl instance,
) => <String, dynamic>{
  'id': _$GroupeIdEnumMap[instance.id]!,
  'label': instance.label,
  'icone': instance.icone,
  'ordre': instance.ordre,
};

const _$GroupeIdEnumMap = {
  GroupeId.cmd: 'cmd',
  GroupeId.ach: 'ach',
  GroupeId.cpta: 'cpta',
  GroupeId.sortie: 'sortie',
};
