# CNX-ONE-Patrimoine — Architecture Flutter & bonnes pratiques

Document de référence pour le projet `cnx_one_patrimoine`. Basé sur les leçons de l'audit du projet précédent (ce qu'il ne faut *pas* reproduire) et les besoins confirmés (multi-tenant, backend pas encore prêt pour Patrimoine, données sensibles).

---

## 1. Style d'architecture : Feature-first + 3 couches par feature

Ni "Clean Architecture" complète et rigide (trop lourde pour un module comme ça), ni le style plat de l'ancien projet (trop fragile). Compromis pragmatique et éprouvé en Flutter :

**Découpage par feature** (pas par type technique) — chaque fonctionnalité est autonome et contient ses propres 3 couches :

```
lib/
├── main.dart
├── app.dart                        # MaterialApp, thème, routing racine
│
├── core/                           # tout ce qui est transverse, partagé par toutes les features
│   ├── network/
│   │   ├── api_client.dart         # Dio configuré (base URL, timeouts, intercepteurs)
│   │   ├── auth_interceptor.dart   # injection JWT + refresh automatique
│   │   ├── tenant_interceptor.dart # injection du tenantSlug
│   │   └── network_exceptions.dart # exceptions typées (Timeout, NoConnection, Unauthorized, ServerError...)
│   ├── storage/
│   │   └── secure_storage_service.dart   # wrapper flutter_secure_storage (token, refresh, tenant)
│   ├── env/
│   │   └── app_env.dart            # base URL par environnement (dev/staging/prod)
│   ├── error/
│   │   └── result.dart             # type Result<T> / Either pour retourner succès/échec proprement
│   └── router/
│       └── app_router.dart         # go_router : routes + guards (redirection si non connecté)
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── auth_repository_impl.dart
│   │   │   └── models/user_model.dart          (freezed + json_serializable)
│   │   ├── domain/
│   │   │   └── auth_repository.dart            (interface abstraite)
│   │   └── presentation/
│   │       ├── login_screen.dart
│   │       └── auth_controller.dart            (Riverpod StateNotifier/AsyncNotifier)
│   │
│   └── patrimoine/
│       ├── data/
│       │   ├── patrimoine_repository_impl.dart # implémentation réelle (API)
│       │   ├── patrimoine_repository_mock.dart # implémentation mock (backend pas prêt)
│       │   └── models/
│       │       ├── immobilisation_model.dart
│       │       ├── campagne_model.dart
│       │       └── comptage_model.dart
│       ├── domain/
│       │   └── patrimoine_repository.dart      (interface abstraite — LE contrat commun)
│       └── presentation/
│           ├── accueil/accueil_screen.dart
│           ├── scanner/scanner_screen.dart
│           ├── historique/historique_screen.dart
│           ├── fiche/fiche_detail_screen.dart
│           └── patrimoine_controller.dart
│
├── shared/                         # widgets réutilisables entre features (boutons, chips, cards...)
│   └── widgets/
│
└── theme/
    └── app_theme.dart
```

**Pourquoi ce découpage :** chaque feature est indépendante — on peut travailler sur `patrimoine` sans toucher à `auth`. Le dossier `domain/` contient l'interface (le contrat), `data/` contient les implémentations (réelle et mock), `presentation/` ne connaît que l'interface, jamais l'implémentation concrète → c'est ce qui permet de basculer mock → API réelle sans toucher à un seul écran.

---

## 2. Gestion d'état : **Riverpod**

Choix tranché (plus de BLoC/Provider/GetX en flottant) :

- **Pourquoi Riverpod plutôt que BLoC** : moins de boilerplate, testable nativement, la DI est intégrée (pas besoin de `get_it` en plus), la communauté Flutter s'est largement standardisée dessus depuis 2 ans.
- **Pourquoi pas Provider** : Riverpod est son successeur direct, corrige ses limites (pas de `BuildContext` requis, compile-time safety).
- **Pourquoi pas GetX** : moins structurant, encourage des raccourcis (service locator global, moins testable) qu'on veut justement éviter après l'audit du projet précédent.

Usage concret :
- `Provider` pour exposer les repositories (injection de dépendances)
- `AsyncNotifierProvider` / `FutureProvider` pour les données chargées depuis le réseau (gère automatiquement loading/error/data — fini les `_isLoading` booléens manuels)
- `StateNotifierProvider` pour un état plus complexe avec des transitions (ex. session d'inventaire en cours pendant le scan)

---

## 3. Client réseau : Dio, configurable, avec intercepteurs

```dart
// core/network/api_client.dart
class ApiClient {
  static Dio create(Ref ref) {
    final dio = Dio(BaseOptions(
      baseUrl: AppEnv.baseUrl,              // configurable par environnement, JAMAIS en dur
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ));

    dio.interceptors.addAll([
      AuthInterceptor(ref),      // ajoute le Bearer token, gère le refresh automatique sur 401
      TenantInterceptor(ref),    // ajoute le header X-Tenant-Slug
      if (kDebugMode) LogInterceptor(responseBody: true),
    ]);

    return dio;
  }
}
```

**Base URL par environnement** — jamais codée en dur dans une classe, injectée au build :
```bash
flutter run --dart-define=API_BASE_URL=https://backend.zira24.com/api/v1
flutter build apk --dart-define=API_BASE_URL=https://backend.zira24.com/api/v1
```

**Refresh token automatique** — l'`AuthInterceptor` intercepte les 401, tente un `POST /auth/refresh`, rejoue la requête originale si succès, sinon déconnecte proprement et notifie l'état global d'auth (pas juste un `throw` que chaque écran doit gérer comme dans l'ancien projet).

**Multi-tenant** — `TenantInterceptor` ajoute systématiquement le header (ex. `X-Tenant-Slug`) lu depuis le storage sécurisé, sur toutes les requêtes sauf le login initial.

---

## 4. Gestion des erreurs : typée, jamais de message technique affiché

```dart
// core/network/network_exceptions.dart
sealed class AppException implements Exception {
  final String message;   // message métier, prêt à afficher à l'utilisateur
  const AppException(this.message);
}
class TimeoutAppException extends AppException {
  const TimeoutAppException() : super("Le serveur met trop de temps à répondre.");
}
class NoConnectionException extends AppException {
  const NoConnectionException() : super("Pas de connexion internet.");
}
class UnauthorizedException extends AppException {
  const UnauthorizedException() : super("Session expirée, reconnectez-vous.");
}
class ServerException extends AppException {
  const ServerException(super.message); // message extrait du JSON d'erreur backend, PAS un texte fixe
}
```

Toute méthode de repository retourne un `Result<T>` (succès ou `AppException`), jamais une exception brute qui remonte jusqu'à l'UI sans traduction :

```dart
sealed class Result<T> {}
class Success<T> extends Result<T> { final T data; Success(this.data); }
class Failure<T> extends Result<T> { final AppException error; Failure(this.error); }
```

---

## 5. Modèles de données : freezed + json_serializable

Plus jamais de `fromJson`/`toJson` écrits à la main (source de bugs dans l'ancien projet) :

```dart
@freezed
class ImmobilisationModel with _$ImmobilisationModel {
  const factory ImmobilisationModel({
    required String id,
    required String designation,
    required String categorie,
    required String siteId,
    required String statut,
    required String etat,
    required DateTime dateAcquisition,
    required double valeurAcquisition,
  }) = _ImmobilisationModel;

  factory ImmobilisationModel.fromJson(Map<String, dynamic> json) =>
      _$ImmobilisationModelFromJson(json);
}
```
→ immutabilité garantie, `copyWith` gratuit, égalité structurelle gratuite, mapping JSON généré (moins d'erreurs de frappe sur les noms de champs).

---

## 6. Repository pattern : interface + double implémentation (Mock / API)

C'est LE point qui résout le problème "backend pas encore prêt" :

```dart
// domain/patrimoine_repository.dart — le contrat, LA seule chose que l'UI connaît
abstract class PatrimoineRepository {
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({String? siteId});
  Future<Result<ImmobilisationModel>> getImmobilisation(String id);
  Future<Result<void>> validerComptage(String campagneId, ComptageModel comptage);
}

// data/patrimoine_repository_mock.dart — utilisé tant que Seven n'a pas livré
class PatrimoineRepositoryMock implements PatrimoineRepository {
  @override
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({String? siteId}) async {
    await Future.delayed(const Duration(milliseconds: 400)); // simule la latence réseau
    return Success(mockImmobilisations.where((m) => siteId == null || m.siteId == siteId).toList());
  }
  // ...
}

// data/patrimoine_repository_impl.dart — activé dès que les routes existent
class PatrimoineRepositoryImpl implements PatrimoineRepository {
  final Dio _dio;
  PatrimoineRepositoryImpl(this._dio);

  @override
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({String? siteId}) async {
    try {
      final res = await _dio.get('/patrimoine/immobilisations', queryParameters: {'site': siteId});
      final list = (res.data as List).map((e) => ImmobilisationModel.fromJson(e)).toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(mapDioError(e));
    }
  }
}
```

**Bascule mock ↔ API** en un seul endroit (le provider Riverpod) :
```dart
final patrimoineRepositoryProvider = Provider<PatrimoineRepository>((ref) {
  const useMock = bool.fromEnvironment('USE_MOCK', defaultValue: true);
  return useMock
      ? PatrimoineRepositoryMock()
      : PatrimoineRepositoryImpl(ref.watch(dioProvider));
});
```
→ `flutter run --dart-define=USE_MOCK=false` le jour où Seven livre. Aucun écran à modifier.

---

## 7. Stockage local

- **Token + refresh token + tenantSlug** : `flutter_secure_storage` (seul bon réflexe conservé de l'ancien projet).
- **Cache de données** (nouveau, absent avant) : envisager `Hive` pour permettre un minimum de consultation hors-ligne des biens déjà chargés — utile sur le terrain (entrepôts, sites distants) où la connexion peut être instable pendant le scan.

---

## 8. Convention de nommage & style de code

- Fichiers : `snake_case.dart`
- Classes : `PascalCase`
- Variables/méthodes : `camelCase`
- Un fichier = une classe publique principale
- Analyse statique stricte : activer `very_good_analysis` ou a minima renforcer `analysis_options.yaml` (pas de `dynamic` non justifié, pas de `print()` en prod, `prefer_const_constructors`, etc.)

---

## 9. Dépendances principales à ajouter (`pubspec.yaml`)

```yaml
dependencies:
  flutter_riverpod: ^2.5.0
  dio: ^5.4.0
  freezed_annotation: ^2.4.0
  json_annotation: ^4.9.0
  flutter_secure_storage: ^9.0.0
  go_router: ^14.0.0
  hive_flutter: ^1.1.0        # cache local optionnel

dev_dependencies:
  build_runner: ^2.4.0
  freezed: ^2.5.0
  json_serializable: ^6.8.0
  very_good_analysis: ^6.0.0
  mocktail: ^1.0.0            # pour tester les repositories via l'interface
```

---

## 10. Testabilité

Grâce au repository pattern, chaque `Controller`/`AsyncNotifier` peut être testé en lui injectant un `PatrimoineRepository` fake (via `mocktail`) sans jamais toucher au réseau — impossible avec l'ancien projet où les services étaient instanciés en dur dans les écrans.

---

## Résumé des décisions actées

| Sujet | Décision |
|---|---|
| Architecture | Feature-first, 3 couches (data/domain/presentation) par feature |
| State management | Riverpod |
| Client HTTP | Dio + intercepteurs (auth, tenant, refresh auto) |
| Base URL | Configurable par `--dart-define`, jamais en dur |
| Erreurs | Exceptions typées + `Result<T>`, messages backend exploités |
| Modèles | freezed + json_serializable |
| Repository | Interface abstraite + impl Mock et API interchangeables |
| Stockage token | flutter_secure_storage |
| Cache offline | Hive (à activer si besoin terrain confirmé) |
| Routing | go_router avec guards d'auth |
