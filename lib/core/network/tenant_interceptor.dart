import 'package:dio/dio.dart';

/// Point d'injection pour un futur header tenant — **actuellement inerte**.
///
/// Vérifié par appel réel contre `backend.zira24.com` (rapport empirique GET
/// Patrimoine) : le header `X-Tenant-Slug` est **ignoré** par le backend sur
/// toutes les routes testées (`/patrimoine/sites`, `/patrimoine/
/// immobilisations`, `/patrimoine/immobilisations/:id`, `/patrimoine/
/// campagnes`) — les réponses sont strictement identiques avec ou sans ce
/// header. Le tenant est résolu côté serveur depuis le JWT lui-même
/// (`user.tenantSlug` / `user.tenantId` déjà présents dans la réponse de
/// `POST /auth/login`), pas depuis un header séparé.
///
/// On garde la classe et son point d'injection dans `dioProvider` (voir
/// `features/auth/presentation/auth_providers.dart`) au cas où un futur
/// endpoint en aurait besoin, mais elle ne fait rien pour l'instant — ne pas
/// réactiver l'ajout du header sans une nouvelle vérification empirique qui
/// contredirait ce constat.
class TenantInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }
}
