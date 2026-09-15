import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Profil utilisateur — retour de `GET /auth/me`.
///
/// ⚠️ PROVISOIRE : l'OpenAPI du backend (`/docs/json`) ne documente aucun
/// corps de réponse pour `/auth/me` (ni pour `/auth/login`). Les champs
/// `id`/`email` sont quasi certains ; `name`/`firstName`/`lastName`/`phone`/
/// `image` sont déduits du corps de requête de `PUT /auth/profile` (mêmes
/// champs, backend confirmé). À corriger dès réception d'un exemple réel de
/// réponse `/auth/me` — ne pas ajouter de nouvel écran qui dépend d'un champ
/// non encore confirmé (ex. rôle, permissions) sans revalider ce modèle.
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? name,
    String? firstName,
    String? lastName,
    String? phone,
    String? image,
    String? tenantSlug,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
