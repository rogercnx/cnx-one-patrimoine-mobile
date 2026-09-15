import 'package:freezed_annotation/freezed_annotation.dart';

import 'patrimoine_enums.dart';

part 'workflow_groupe_model.freezed.dart';
part 'workflow_groupe_model.g.dart';

/// `workflow_groupes` (`GET /groupes`) — confirmé par appel réel (compte
/// `dev-seeg`, 2026-09-15) : `{data: [{id, label, icone, ordre}, ...]}`,
/// 4 lignes (`cmd`/`ach`/`cpta`/`sortie`).
@freezed
class WorkflowGroupeModel with _$WorkflowGroupeModel {
  const factory WorkflowGroupeModel({
    required GroupeId id,
    required String label,
    String? icone,
    int? ordre,
  }) = _WorkflowGroupeModel;

  factory WorkflowGroupeModel.fromJson(Map<String, dynamic> json) => _$WorkflowGroupeModelFromJson(json);
}
