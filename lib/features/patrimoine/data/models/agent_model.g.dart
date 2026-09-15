// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentModelImpl _$$AgentModelImplFromJson(Map<String, dynamic> json) =>
    _$AgentModelImpl(
      id: json['id'] as String,
      nom: json['nom'] as String,
      role: json['role'] as String,
      initiales: json['initiales'] as String,
    );

Map<String, dynamic> _$$AgentModelImplToJson(_$AgentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'role': instance.role,
      'initiales': instance.initiales,
    };
