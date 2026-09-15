import 'package:freezed_annotation/freezed_annotation.dart';

import 'patrimoine_enums.dart';

part 'workflow_etape_model.freezed.dart';
part 'workflow_etape_model.g.dart';

/// `workflow_etapes` (`GET /etapes`) — confirmé par appel réel (compte
/// `dev-seeg`, 2026-09-15) : `{data: [{id, groupe_id, label_court, label,
/// icone, ordre}, ...]}`, 10 lignes (`besoin`→`sortie`, `icone` observé
/// `null` sur toutes).
@freezed
class WorkflowEtapeModel with _$WorkflowEtapeModel {
  const factory WorkflowEtapeModel({
    required EtapeId id,
    @JsonKey(name: 'groupe_id') required GroupeId groupeId,
    @JsonKey(name: 'label_court') String? labelCourt,
    required String label,
    String? icone,
    int? ordre,
  }) = _WorkflowEtapeModel;

  factory WorkflowEtapeModel.fromJson(Map<String, dynamic> json) => _$WorkflowEtapeModelFromJson(json);
}
