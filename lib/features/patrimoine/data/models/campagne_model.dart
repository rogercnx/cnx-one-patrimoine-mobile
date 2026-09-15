import 'package:freezed_annotation/freezed_annotation.dart';

part 'campagne_model.freezed.dart';
part 'campagne_model.g.dart';

enum StatutCampagne {
  @JsonValue('en_cours')
  enCours,
  @JsonValue('cloturee')
  cloturee,
}

/// `campagnes_inventaire` — confirmé par exemple JSON réel dans la doc Seven
/// (2026-09-15) : `date_fin`/`perimetre` peuvent être `null` (campagne sans
/// fin/périmètre définis) ; `gel`, `perimetre_site_id`, `responsable` sont
/// des colonnes additives récentes (nullable).
@freezed
class CampagneModel with _$CampagneModel {
  const CampagneModel._();

  const factory CampagneModel({
    required String id,
    required String reference,
    required String libelle,
    @JsonKey(name: 'date_debut') required DateTime dateDebut,
    @JsonKey(name: 'date_fin') DateTime? dateFin,
    String? perimetre,
    required StatutCampagne statut,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(false) bool gel,
    @JsonKey(name: 'perimetre_site_id') String? perimetreSiteId,
    String? responsable,
  }) = _CampagneModel;

  factory CampagneModel.fromJson(Map<String, dynamic> json) => _$CampagneModelFromJson(json);

  /// Jours restants avant la fin de la campagne (0 si terminée ou sans date de fin).
  int joursRestants(DateTime maintenant) {
    final fin = dateFin;
    if (fin == null) return 0;
    final diff = fin.difference(DateTime(maintenant.year, maintenant.month, maintenant.day)).inDays;
    return diff < 0 ? 0 : diff;
  }
}
