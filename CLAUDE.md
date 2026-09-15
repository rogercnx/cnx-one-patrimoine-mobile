# CLAUDE.md — CNX-ONE-Patrimoine

Ce fichier fait autorité sur toute décision technique dans ce projet. En cas de doute entre une habitude générique et une règle ci-dessous, la règle ci-dessous gagne.

---

## 1. Règles officielles Flutter/Dart (plugin `dart-flutter`)

Source : [flutter/agent-plugins](https://github.com/flutter/agent-plugins/tree/main/rules). Une seule règle y est publiée à ce jour, et elle s'applique ici :

- **Hot reload/restart proactif** : après toute modification d'un fichier `.dart` sous `lib/` (hors commentaires/whitespace), se connecter à l'application en cours d'exécution via les outils du Dart MCP server et déclencher :
  - `hot_reload` après une modification de widget/UI ou de méthode simple,
  - `hot_restart` après une modification de logique fondamentale, de `initState`, d'état global/statique, ou de `main()`.
  - Ne pas déclencher pour des fichiers hors `lib/` (`test/`, `integration_test/`, etc.) ni pour des changements de commentaires/documentation seuls.

*(Le dossier `rules` du repo officiel ne contient pas d'autres règles à ce jour — rien sur Riverpod, Dio ou l'architecture feature-first n'y est publié. Ces sujets sont couverts par la section 2 ci-dessous, propre à ce projet.)*

---

## 2. Architecture du projet

> Source : `fichier_md/CNX-ONE-Patrimoine_Architecture.md` — reproduite intégralement ci-dessous, elle fait autorité sur toute décision technique.

### 2.1 Style d'architecture : Feature-first + 3 couches par feature

Ni Clean Architecture rigide, ni style plat. Découpage par feature, chaque feature autonome avec ses 3 couches :

```
lib/
├── main.dart
├── app.dart                        # MaterialApp, thème, routing racine
│
├── core/                           # transverse, partagé par toutes les features
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
│   │   └── result.dart             # type Result<T> pour retourner succès/échec proprement
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
├── shared/                         # widgets réutilisables entre features
│   └── widgets/
│
└── theme/
    └── app_theme.dart
```

**Pourquoi** : chaque feature est indépendante (`patrimoine` sans toucher `auth`). `domain/` contient l'interface (le contrat), `data/` les implémentations (réelle et mock), `presentation/` ne connaît que l'interface — jamais l'implémentation concrète. C'est ce qui permet de basculer mock → API réelle sans toucher un seul écran.

### 2.2 Gestion d'état : Riverpod

Choix tranché — pas de BLoC/Provider/GetX flottant :
- **Pourquoi Riverpod** : moins de boilerplate que BLoC, testable nativement, DI intégrée (pas besoin de `get_it`), standard de facto de l'écosystème Flutter récent.
- **Pourquoi pas Provider** : Riverpod en est le successeur, corrige ses limites (pas de `BuildContext` requis, compile-time safety).
- **Pourquoi pas GetX** : encourage des raccourcis (service locator global, moins testable) — exactement ce qu'on évite après l'audit du projet précédent.

Usage concret :
- `Provider` pour exposer les repositories (DI)
- `AsyncNotifierProvider` / `FutureProvider` pour les données réseau (loading/error/data gérés automatiquement)
- `StateNotifierProvider` pour un état complexe avec transitions (ex. session d'inventaire pendant le scan)

### 2.3 Client réseau : Dio, configurable, avec intercepteurs

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

Base URL par environnement, injectée au build (jamais en dur) :
```bash
flutter run --dart-define=API_BASE_URL=https://backend.zira24.com/api/v1
flutter build apk --dart-define=API_BASE_URL=https://backend.zira24.com/api/v1
```

Clé API (`X-API-Key`, requise en prod — voir section Patrimoine ci-dessous), même
principe : jamais codée en dur, jamais commitée, lue uniquement via `--dart-define` :
```bash
flutter run --dart-define=API_BASE_URL=... --dart-define=API_KEY=<clé fournie séparément>
```
Si `API_KEY` est omis au build, le header est simplement omis (`ApiKeyInterceptor`,
`core/network/api_key_interceptor.dart`) — toléré uniquement contre un backend en
développement.

- **Refresh token automatique** : `AuthInterceptor` intercepte les 401, tente `POST /auth/refresh`, rejoue la requête originale si succès, sinon déconnecte proprement et notifie l'état global d'auth.
- **Multi-tenant** : `TenantInterceptor` ajoute systématiquement le header `X-Tenant-Slug` lu depuis le storage sécurisé, sur toutes les requêtes sauf le login initial.

### 2.4 Gestion des erreurs : typée, jamais de message technique affiché

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

Toute méthode de repository retourne un `Result<T>` (succès ou `AppException`), jamais une exception brute remontée sans traduction jusqu'à l'UI :
```dart
sealed class Result<T> {}
class Success<T> extends Result<T> { final T data; Success(this.data); }
class Failure<T> extends Result<T> { final AppException error; Failure(this.error); }
```

### 2.5 Modèles de données : freezed + json_serializable

Plus jamais de `fromJson`/`toJson` écrits à la main :
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
→ immutabilité garantie, `copyWith` gratuit, égalité structurelle gratuite, mapping JSON généré.

### 2.6 Repository pattern : interface + double implémentation (Mock / API)

Résout le problème "backend pas encore prêt" :
```dart
// domain/patrimoine_repository.dart — le contrat, LA seule chose que l'UI connaît
abstract class PatrimoineRepository {
  Future<Result<List<ImmobilisationModel>>> getImmobilisations({String? siteId});
  Future<Result<ImmobilisationModel>> getImmobilisation(String id);
  Future<Result<void>> validerComptage(String campagneId, ComptageModel comptage);
}

// data/patrimoine_repository_mock.dart — utilisé tant que le backend n'a pas livré
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

Bascule mock ↔ API en un seul endroit (le provider Riverpod) :
```dart
final patrimoineRepositoryProvider = Provider<PatrimoineRepository>((ref) {
  const useMock = bool.fromEnvironment('USE_MOCK', defaultValue: true);
  return useMock
      ? PatrimoineRepositoryMock()
      : PatrimoineRepositoryImpl(ref.watch(dioProvider));
});
```
→ `flutter run --dart-define=USE_MOCK=false` le jour où le backend livre. Aucun écran à modifier.

### 2.7 Stockage local

- **Token + refresh token + tenantSlug** : `flutter_secure_storage`.
- **Cache de données** (nouveau, absent de l'ancien projet) : envisager `Hive` pour la consultation hors-ligne des biens déjà chargés — utile sur le terrain (entrepôts, sites distants) où la connexion peut être instable pendant le scan.

### 2.8 Convention de nommage & style de code

- Fichiers : `snake_case.dart`
- Classes : `PascalCase`
- Variables/méthodes : `camelCase`
- Un fichier = une classe publique principale
- Analyse statique stricte : `very_good_analysis` ou a minima un `analysis_options.yaml` renforcé (pas de `dynamic` non justifié, pas de `print()` en prod, `prefer_const_constructors`, etc.)

### 2.9 Dépendances principales (`pubspec.yaml`)

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

### 2.10 Testabilité

Grâce au repository pattern, chaque `Controller`/`AsyncNotifier` est testable en lui injectant un `PatrimoineRepository` fake (via `mocktail`) sans jamais toucher au réseau.

### 2.11 Résumé des décisions actées

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

---

## 3. Contexte métier

**Projet** : CNX-ONE-Patrimoine, module mobile Android/iOS de gestion patrimoniale (immobilisations, inventaire physique, cycle d'acquisition), rattaché au SaaS CNX-one / Zira24.

**Backend cible** : `https://backend.zira24.com` (auth JWT + refresh déjà disponible, routes Patrimoine pas encore livrées par le backend dev — développement en mode mock en attendant, via repository pattern interchangeable, cf. section 2.6).

### 3.1 Spécifications tables & routes Patrimoine

> Source : `fichier_md/CNX-ONE-Patrimoine_Specs_Backend.md` — préparée pour l'équipe backend, reproduite ici pour référence lors de l'implémentation des modèles/repositories côté mobile.

Backend existant : `https://backend.zira24.com` — Auth JWT (bearer + refresh), multi-tenant (`tenantSlug`), permissions par module. Convention pour toutes les routes ci-dessous : préfixe `/api/v1/patrimoine/...`, sécurité `bearerAuth`, permissions dédiées (ex. `patrimoine:inventaire:view`, `patrimoine:dossier:validate`, etc.).

#### PARTIE 1 — Portée mobile actuelle : Inventaire physique (comptage)

Périmètre couvert par les écrans mobiles déjà designés (Accueil, Scanner, Historique, Fiche détail).

**Tables**

- **`sites`** : `id` (uuid/pk), `code`, `nom`, `ville`, `latitude`, `longitude`, `tenant_id`.
- **`immobilisations`** : `id` (uuid/pk), `code` (unique, ex. `IMMO-2020-0104`), `designation`, `categorie`, `compte_comptable`, `famille` (`immobilier`\|`mobilier`), `site_id` (fk), `local`, `affectataire`, `statut` (`actif`\|`stock`\|`sortie`\|`cede`), `etat` (`neuf`\|`bon`\|`moyen`\|`degrade`\|`horsservice`), `fournisseur`, `bon_commande_ref`, `facture_ref` (nullable), `date_acquisition`, `valeur_acquisition`, `date_mise_service` (nullable), `duree_amortissement` (années, 0 = non amortissable), `methode_amortissement` (`lineaire`\|`degressif`\|`non_amortissable`), `montant_amorti`, `date_dernier_inventaire` (nullable), `sortie_ref` (nullable, fk logique vers `dossiers`), `tenant_id`.
- **`immobilisation_entretiens`** : `id`, `immobilisation_id` (fk), `date`, `titre`, `cout`, `prestataire`, `observation` (nullable), `bon_commande_ref`/`bon_livraison_ref`/`facture_ref`/`dossier_ref` (nullable), `duree_intervention` (nullable), `technicien` (nullable).
- **`immobilisation_attributions`** (historique des mouvements/détenteurs) : `id`, `immobilisation_id` (fk), `date`, `detenteur`, `lieu`, `motif`, `acte_reference`.
- **`immobilisation_photos`** : `id`, `immobilisation_id` (fk), `date`, `titre`, `message` (nullable), `auteur`, `tenant_id`.
- **`immobilisation_photo_fichiers`** (1-N avec la table ci-dessus) : `id`, `photo_id` (fk), `url`.
- **`campagnes_inventaire`** : `id`, `reference` (ex. `INV-2026-02`), `libelle`, `date_debut`, `date_fin`, `perimetre`, `statut` (`en_cours`\|`cloturee`), `tenant_id`.
- **`inventaire_comptages`** (chaque scan/pointage) : `id`, `campagne_id` (fk), `immobilisation_id` (fk), `agent_id` (fk → users), `resultat` (`ok`\|`ecart`\|`introuvable`), `date_heure`, `etat_constate` (nullable), `site_constate` (nullable), `affectataire_constate` (nullable), `note` (nullable).

**Routes API — Inventaire**

```
GET    /api/v1/patrimoine/sites
GET    /api/v1/patrimoine/immobilisations?site=&statut=&etat=&categorie=&q=
GET    /api/v1/patrimoine/immobilisations/:id
GET    /api/v1/patrimoine/immobilisations/:id/entretiens
GET    /api/v1/patrimoine/immobilisations/:id/attributions
GET    /api/v1/patrimoine/immobilisations/:id/photos
POST   /api/v1/patrimoine/immobilisations/:id/photos          (multipart upload)

GET    /api/v1/patrimoine/campagnes?statut=en_cours
GET    /api/v1/patrimoine/campagnes/:id
GET    /api/v1/patrimoine/campagnes/:id/comptages?agent_id=
POST   /api/v1/patrimoine/campagnes/:id/comptages              (valider un comptage)
PATCH  /api/v1/patrimoine/campagnes/:id/comptages/:comptageId  (corriger un comptage)
GET    /api/v1/patrimoine/campagnes/:id/stats                  (avancement par site, écarts, KPIs dashboard Accueil)

GET    /api/v1/patrimoine/lookup/qr/:code                      (résout un QR scanné → immobilisation)
```

#### PARTIE 2 — Extension future : Workflow complet (Commandes → Achats → Comptabilité → Sorties)

**Non confirmé pour le mobile** — modèle existant dans les maquettes (probablement version web/desktop), à anticiper seulement si le mobile doit un jour exposer la validation de dossiers. Circuit "3 mains" : Maker (demandeur) → Contrôleur (responsable) → Autorisation (DAF/DG), répété à chaque étape clé.

**Tables**

- **`workflow_groupes`** : `id` (varchar/pk : `cmd`, `ach`, `cpta`, `sortie`), `label`, `icone`, `ordre`.
- **`workflow_etapes`** : `id` (varchar/pk : `besoin`, `verif`, `autor`, `consult`, `bc`, `bl`, `fact`, `qualif`, `immo`, `sortie`), `groupe_id` (fk), `label_court`, `label`, `icone`, `ordre`.
- **`dossiers`** (une demande d'achat, du besoin jusqu'à la fiche d'immobilisation ou la sortie) : `id`, `reference` (unique, ex. `ACQ-2026-0148`/`SOR-2026-0031`), `site_id` (fk), `objet`, `categorie`, `famille` (`immobilier`\|`mobilier`), `departement`, `demandeur_id` (fk → users), `date_demande`, `montant`, `budget_prevu` (nullable), `etape_courante_id` (fk → workflow_etapes), `qualification` (nullable : `immo`\|`charge`\|`arbitrage`), `compte_comptable` (nullable), `fournisseur` (nullable), `bon_commande_ref`/`facture_ref` (nullable), `alerte` (nullable), `immobilisations_generees` (nullable), `motif_sortie` (nullable : `vol`\|`perte`\|`accident`\|`vente`\|`rebut`, si groupe = sortie), `tenant_id`.
- **`dossier_bons_livraison`** : `id`, `dossier_id` (fk), `reference`, `quantite_recue`, `commentaire` (nullable).
- **`dossier_validations`** (cœur du circuit 3 mains — une ligne par rôle par étape-groupe) : `id`, `dossier_id` (fk), `groupe_id` (fk), `role` (`maker`\|`controleur`\|`autorisation`), `validateur_id` (fk → users, nullable), `statut` (nullable : `ok`\|`attente`\|null), `date_validation` (nullable).
- **`dossier_offres`** (appel d'offres fournisseurs) : `id`, `dossier_id` (fk), `fournisseur`, `montant`, `delai`, `observation` (nullable), `selectionnee` (boolean).
- **`dossier_trace`** (journal d'audit) : `id`, `dossier_id` (fk), `date` (nullable si étape en attente), `auteur`, `action`, `detail` (nullable), `en_attente` (boolean).
- **`dossier_justificatifs`** (surtout pour les sorties : vol, perte...) : `id`, `dossier_id` (fk), `libelle`, `statut` (`fourni`\|`manquant`).
- **`motifs_sortie`** (référentiel, peut être un enum) : `vol`, `perte`, `accident`, `vente`, `rebut`.

**Routes API — Workflow complet**

```
GET    /api/v1/patrimoine/groupes
GET    /api/v1/patrimoine/etapes

GET    /api/v1/patrimoine/dossiers?groupe=&etape=&site=&departement=&alerte=
GET    /api/v1/patrimoine/dossiers/:id
POST   /api/v1/patrimoine/dossiers                              (créer une demande — étape "besoin")
PATCH  /api/v1/patrimoine/dossiers/:id

POST   /api/v1/patrimoine/dossiers/:id/validations              (enregistrer une validation maker/contrôleur/autorisation)
POST   /api/v1/patrimoine/dossiers/:id/offres
PATCH  /api/v1/patrimoine/dossiers/:id/offres/:offreId/selectionner
POST   /api/v1/patrimoine/dossiers/:id/livraisons               (enregistrer un BL)
POST   /api/v1/patrimoine/dossiers/:id/qualification             (immo / charge / arbitrage)
POST   /api/v1/patrimoine/dossiers/:id/generer-immobilisations   (crée les lignes dans `immobilisations`)
POST   /api/v1/patrimoine/dossiers/:id/sortie                    (motif + justificatifs)
GET    /api/v1/patrimoine/dossiers/:id/trace

GET    /api/v1/patrimoine/kpi/alertes                            (réceptions partielles, sorties incomplètes, hors budget, BC en attente...)
```

#### Notes backend

1. **Auth/permissions** : réutiliser le système JWT + rôles/permissions déjà en place sur `backend.zira24.com`. Permissions granulaires par action (`patrimoine:inventaire:count`, `patrimoine:dossier:validate:maker`, `patrimoine:dossier:validate:controleur`, `patrimoine:dossier:validate:autorisation`), le circuit 3 mains dépendant du rôle de l'utilisateur connecté.
2. **Multi-tenant** : toutes les tables portent `tenant_id`, cohérent avec le reste du SaaS.
3. **Photos** : à uploader vers le module Drive existant du SaaS si possible plutôt que réinventer un stockage dédié — `immobilisation_photo_fichiers.url` pointerait alors vers une ressource Drive.
4. **Priorité** : la Partie 1 (inventaire) est la priorité immédiate mobile. La Partie 2 peut être développée en parallèle côté web, ou reportée.

---

### 3.2 Patrimoine — schéma API confirmé (2026-09-15)

> Source : document complémentaire de Seven ("Patrimoine mobile — schémas requête/réponse"), en réponse à 6 questions précises sur `/api/v1/patrimoine/**`. Remplace toutes les hypothèses précédentes sur ce périmètre.

- **Casse asymétrique, propre à Patrimoine** : les **réponses** sont en **snake_case** (`site_id`, `date_acquisition`, `valeur_acquisition`, `compte_comptable`, `bon_commande_ref`...). Les **corps de requête d'écriture** (POST/PATCH) sont en **camelCase** (`immobilisationId`, `siteId`, `budgetPrevu`...). Ne pas confondre avec le module **Auth**, qui reste entièrement en camelCase (requêtes et réponses) — les deux conventions coexistent, ne jamais les uniformiser par erreur.
- **Deux headers requis en prod** : `Authorization: Bearer <jwt>` **et** `X-API-Key: <clé>` (voir `ApiKeyInterceptor`, section 2.3). Le tenant vient uniquement du JWT — ne jamais envoyer `X-Tenant-ID`/`X-Tenant-Slug` sauf besoin explicite (risque de `403 TENANT_MISMATCH` si incohérent avec le JWT). `X-API-Key` toléré absent seulement en développement.
- **Enveloppe** : `{ data: T }` ou `{ data: T[] }` partout, **sauf** `GET /immobilisations` où `total`/`page`/`limit` sont à la racine (pas dans un sous-objet `meta`).
- **Pagination** : uniquement sur `GET /immobilisations` (`page` 1-based, défaut 1 ; `limit` défaut 20, plafonné silencieusement à 200). Aucune autre liste n'est paginée.
- **Montants en string** : `valeur_acquisition`, `montant_amorti`, `montant`, `budget_prevu` arrivent en JSON comme des **chaînes** (`"1066666.67"`), pas des nombres — voir `parseFlexibleDouble` (`json_converters.dart`). Idem pour `latitude`/`longitude` sur `Site`.
- **Filtres query non documentés par le swagger, mais actifs** : `GET /immobilisations` (`site`, `statut`, `etat`, `categorie`, `q`), `GET /campagnes` (`statut`), `GET /campagnes/:id/comptages` (`agent_id`), `GET /dossiers` (`groupe`, `etape`, `site`, `departement`, `alerte`).
- **Endpoint photo binaire** : `.../photos/:photoId/fichiers/:fichierId/content` renvoie le contenu brut proxifié par le serveur (pas de redirection ni d'URL signée) — consommer en flux binaire (`ResponseType.bytes` côté Dio), jamais comme du JSON.
- **Champs additifs récents (chantier web organisation, nullable, sans impact mobile si ignorés)** : `Immobilisation.departement`/`.dossier_id` ; `Campagne.gel`/`.perimetre_site_id`/`.responsable` ; `Comptage.zone_id`/`.maj_corrections` ; `Dossier.etape_groupe_id`/`.statut`/`.rejet_motif`/`.fournisseur_id`.
- **Codes d'erreur 409 dédiés** : `POST /campagnes/:id/comptages` → campagne clôturée (`CampagneClotureeException`) ; `POST /dossiers/:id/sortie` → `DOSSIER_HORS_GROUPE_SORTIE` (`DossierHorsGroupeSortieException`) si le dossier n'appartient pas au groupe `sortie`.
- **Pas de garde anti-double-validation** sur `POST /dossiers/:id/validations` : revalider le même rôle avance l'étape à nouveau — éviter tout double appel réseau (débounce UI à prévoir côté écran, hors périmètre de l'implémentation du repository).
- **`GET /groupes`/`GET /etapes` confirmés par appel réel** (2026-09-15, compte `dev-seeg`, avec la vraie clé API) : schéma déduit de CLAUDE.md 3.1 exact à 100 % (4 groupes, 10 étapes, `icone` toujours `null` sur les étapes). Même appel : `X-API-Key` bien appliqué — absent toléré (dev), mais une clé présente et fausse renvoie `401 {statusCode, error: "INVALID_API_KEY", message}` — ce message-erreur spécifique n'était pas documenté par Seven. `sites`/`immobilisations`/`campagnes`/`dossiers` renvoient `{data: []}` sur `dev-seeg` (tenant de test vide, comme lors du rapport empirique précédent) : enveloppes confirmées à nouveau, mais aucun objet réel disponible pour revalider les champs internes au-delà des exemples déjà fournis par Seven.
- **Résiduel non confirmé par un exemple JSON réel** (déduit de CLAUDE.md 3.1 et de la convention snake_case, à revalider dès qu'un objet réel est disponible) : `Entretien`, `Attribution`, `Photo`. **Non implémenté du tout**, faute de tout schéma documenté : `GET /kpi/alertes`.
- **`PatrimoineRepositoryImpl`** couvre désormais l'ensemble des routes confirmées (lecture + écriture, voir `data/patrimoine_repository_impl.dart`) mais reste **non branché** dans `patrimoineRepositoryProvider` — `PatrimoineRepositoryMock` reste actif en attendant une validation manuelle avec un vrai token + la clé API.

---

## 4. Règles de collaboration

- Toujours respecter l'architecture feature-first définie en section 2. Ne pas improviser une autre structure.
- Toujours passer par l'interface repository abstraite (`domain/`), jamais d'appel réseau direct depuis un écran.
- Ne jamais coder une base URL ou une clé en dur — utiliser les variables d'environnement définies (`--dart-define`, `AppEnv`).
- Utiliser freezed + json_serializable pour tout nouveau modèle de données.
- Avant toute modification, lancer `dart analyze` et corriger les warnings avant de considérer une tâche terminée.
- **Convention actée** : quand l'interface `PatrimoineRepository` n'a pas de méthode générique correspondant exactement à une route backend (ex. pas de `getCampagnes()` alors que le backend expose `GET /patrimoine/campagnes`), la solution par défaut est de filtrer côté client sur un champ déjà présent dans le modèle (ex. `getCampagneEnCours()` récupère la liste puis filtre sur `statut == StatutCampagne.enCours`) plutôt que de multiplier les endpoints ou les méthodes d'interface. Voir le mapping `getCampagneEnCours()` dans `PatrimoineRepositoryImpl` comme référence.
- **Règle d'autonomie** : ne demander une validation humaine que lorsqu'une information est réellement indisponible autrement (schéma backend non documenté, ambiguïté entre deux comportements produit différents pour l'utilisateur final, décision irréversible comme une migration de données). Pour toute question qui se résout en consultant ce fichier, le code déjà écrit dans le projet, le MCP Dart/Flutter (`dart_fix`, `dart_format`, analyse de dépendances, doc officielle) ou les skills installés — décider seul, appliquer, et mentionner simplement le choix fait dans le résumé final, sans s'arrêter pour demander confirmation avant d'agir.
- Utiliser systématiquement le serveur MCP Dart/Flutter et les skills du plugin `dart-flutter` pour toute vérification technique (formatage, lint, patterns idiomatiques, hot reload) plutôt que de demander si une approche est correcte — ce sont des faits vérifiables directement.
- Les seuls cas qui justifient encore de s'arrêter et demander : donnée externe manquante non déductible (ex. schéma backend non documenté), choix ayant un impact produit visible pour l'utilisateur final et non tranché par ce fichier, ou action destructive/irréversible (suppression de données, force-push, reset git).
