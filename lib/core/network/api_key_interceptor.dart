import 'package:dio/dio.dart';

/// Injecte le header `X-API-Key` sur toutes les requêtes.
///
/// Confirmé par la documentation Seven (2026-09-15, schémas Patrimoine) :
/// en production, `Authorization: Bearer <jwt>` **et** `X-API-Key: <clé>`
/// sont tous les deux requis — un hook global côté backend vérifie la clé
/// sur toutes les routes `/api/v1/**` sauf une allowlist (health, docs,
/// webhooks). Toléré absent uniquement quand le backend tourne en
/// `NODE_ENV=development`, mais on l'envoie systématiquement dès qu'elle est
/// fournie au build plutôt que de compter sur cette tolérance.
///
/// La clé est lue uniquement via `--dart-define=API_KEY=...` (voir
/// CLAUDE.md section 2.3) — jamais codée en dur, jamais commitée. Si elle
/// n'est pas fournie au build, le header est simplement omis (utile en
/// développement local contre un backend qui la tolère absente).
class ApiKeyInterceptor extends Interceptor {
  static const _apiKey = String.fromEnvironment('API_KEY');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_apiKey.isNotEmpty) {
      options.headers['X-API-Key'] = _apiKey;
    }
    handler.next(options);
  }
}
