import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Profil utilisateur — retour de `POST /auth/login` (champ `user`) et de
/// `GET /auth/me`.
///
/// Confirmé par appel réel contre `backend.zira24.com` (compte `dev-seeg`) :
/// - `/auth/login` → `user` : `id`, `email`, `name`, `tenantId`,
///   `tenantSlug`, `permissions`, `isOwner`.
/// - `/auth/me` → `id`, `email`, `name`, `image`, `phone`, `role`, `roles`,
///   `isEmployee`, `permissions`, `tenantId`, `tenantSlug`, `tenantName`,
///   `cnxlinkAccess`, `permissionsStale`.
///
/// Seuls les champs présents dans les deux réponses (`id`, `email`, `name`,
/// `tenantId`, `tenantSlug`, `permissions`) sont `required` ; le reste est
/// propre à l'une ou l'autre route et donc nullable. Il n'existe pas de
/// `firstName`/`lastName` côté backend — seul `name` (nom complet) existe.
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required String tenantId,
    required String tenantSlug,
    required List<String> permissions,
    String? image,
    String? phone,
    String? role,
    List<String>? roles,
    bool? isEmployee,
    String? tenantName,
    bool? cnxlinkAccess,
    bool? permissionsStale,
    bool? isOwner,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
