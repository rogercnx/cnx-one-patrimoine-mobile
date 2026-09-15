import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_model.freezed.dart';
part 'agent_model.g.dart';

/// Agent d'inventaire (utilisateur `users` côté backend, vue restreinte).
@freezed
class AgentModel with _$AgentModel {
  const factory AgentModel({
    required String id,
    required String nom,
    required String role,
    required String initiales,
  }) = _AgentModel;

  factory AgentModel.fromJson(Map<String, dynamic> json) => _$AgentModelFromJson(json);
}
