import 'package:freezed_annotation/freezed_annotation.dart';

part 'campagne_model.freezed.dart';
part 'campagne_model.g.dart';

enum StatutCampagne {
  @JsonValue('en_cours')
  enCours,
  @JsonValue('cloturee')
  cloturee,
}

/// `campagnes_inventaire` — une campagne de comptage physique.
@freezed
class CampagneModel with _$CampagneModel {
  const CampagneModel._();

  const factory CampagneModel({
    required String id,
    required String reference,
    required String libelle,
    required DateTime dateDebut,
    required DateTime dateFin,
    required String perimetre,
    required StatutCampagne statut,
    required String responsable,
  }) = _CampagneModel;

  factory CampagneModel.fromJson(Map<String, dynamic> json) => _$CampagneModelFromJson(json);

  /// Jours restants avant la fin de la campagne (0 si déjà terminée).
  int joursRestants(DateTime maintenant) {
    final diff = dateFin.difference(DateTime(maintenant.year, maintenant.month, maintenant.day)).inDays;
    return diff < 0 ? 0 : diff;
  }
}
