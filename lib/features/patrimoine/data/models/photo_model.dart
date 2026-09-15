import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

/// `immobilisation_photos` (+ `immobilisation_photo_fichiers` agrégés en [nombreFichiers]).
@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required String id,
    required DateTime date,
    required String titre,
    String? message,
    required String auteur,
    required int nombreFichiers,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
}
