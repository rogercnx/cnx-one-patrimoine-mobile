import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

/// `immobilisation_photos` — colonnes reprises de CLAUDE.md section 3.1
/// (spec backend d'origine) et de la convention snake_case confirmée par la
/// doc Seven — pas d'exemple JSON réel fourni pour cette entité précise.
///
/// [nombreFichiers] est une commodité d'affichage mock-only (défaut 0) :
/// Seven confirme (§6) que chaque photo a des fichiers associés
/// (`.../fichiers/:fichierId/content`), mais ne donne pas le nom exact du
/// champ liste sur `GET .../photos` — non modélisé ici pour ne pas deviner
/// (voir [PatrimoineRepository.getPhotoFichierContent], qui prend le
/// `fichierId` directement en paramètre plutôt que de dépendre de ce champ).
@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    required DateTime date,
    required String titre,
    String? message,
    required String auteur,
    @Default(0) int nombreFichiers,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
}
