# Concepts, normes et dépendances du module Patrimoine

Explication pédagogique de tout ce qui a été utilisé pour construire les écrans Accueil / Scanner / Historique / Fiche détail, et pourquoi.

---

## 1. L'architecture générale : feature-first en 3 couches

### Le concept

Au lieu de ranger le code par **type technique** (un dossier `screens/`, un dossier `models/`, un dossier `services/` — comme dans l'ancien projet audité), on range par **fonctionnalité métier** : tout ce qui concerne "Patrimoine" vit dans `lib/features/patrimoine/`. À l'intérieur de cette feature, 3 sous-dossiers séparent les responsabilités :

```
features/patrimoine/
├── domain/          → LE CONTRAT : que peut-on faire ? (interface, aucune logique)
├── data/             → COMMENT le faire réellement (implémentations, modèles, données)
└── presentation/     → L'AFFICHAGE (écrans, widgets, état d'UI)
```

### Pourquoi c'est utile

- **`presentation/` ne connaît JAMAIS `data/`** — un écran ne sait pas si les données viennent d'un mock, d'une API réelle ou d'un fichier local. Il ne connaît que l'interface dans `domain/`.
- Conséquence concrète dans ce projet : `PatrimoineRepositoryMock` (dans `data/`) peut être remplacée demain par `PatrimoineRepositoryImpl` (avec Dio, appelant `backend.zira24.com`) **sans modifier un seul écran**. C'est le point central de toute cette architecture.
- Ça rend le code testable : on peut injecter un faux repository dans un test sans lancer de vrai réseau.

### Où le voir dans le projet

| Dossier | Rôle | Exemple concret |
|---|---|---|
| `domain/patrimoine_repository.dart` | Interface abstraite — la liste des opérations possibles | `Future<Result<List<ImmobilisationModel>>> getImmobilisations()` |
| `data/patrimoine_repository_mock.dart` | Implémentation concrète #1 (celle utilisée aujourd'hui) | Renvoie les données de `data/mock/patrimoine_mock_data.dart` |
| `presentation/accueil/accueil_screen.dart` | Consomme l'interface via un provider, ignore tout le reste | `ref.watch(patrimoineRegistryProvider)` |

---

## 2. Le pattern Repository (interface + implémentation interchangeable)

### Le concept

Un **repository** est une classe qui fait l'intermédiaire entre "ce dont l'app a besoin" (des immobilisations, une campagne...) et "où ça se trouve réellement" (mock, base locale, API). On définit d'abord un contrat abstrait (`abstract class PatrimoineRepository`), puis une ou plusieurs implémentations concrètes.

### À quel moment il intervient

Dès qu'un écran a besoin d'une donnée métier. Exemple concret dans `patrimoine_providers.dart` :

```dart
final patrimoineRepositoryProvider = Provider<PatrimoineRepository>((ref) {
  return PatrimoineRepositoryMock();   // ← LE seul endroit à changer pour brancher le vrai backend
});
```

Tout le reste de l'app appelle `ref.watch(patrimoineRepositoryProvider)` et obtient un `PatrimoineRepository` — sans jamais écrire `PatrimoineRepositoryMock` ailleurs dans le code.

### Pourquoi pas d'appel direct depuis l'écran ?

Si `AccueilScreen` appelait directement `PatrimoineMockData.immobilisations`, il faudrait réécrire l'écran le jour où les vraies routes API existent. En passant par l'interface, le jour J, on ajoute juste une nouvelle classe `PatrimoineRepositoryImpl implements PatrimoineRepository` (avec Dio dedans) et on change **une ligne** dans `patrimoineRepositoryProvider`.

---

## 3. Le pattern `Result<T>` (gestion d'erreurs typée)

### Le concept

Au lieu qu'une méthode puisse soit renvoyer une donnée, soit lever n'importe quelle exception non prévisible, elle renvoie toujours un objet `Result<T>` qui est **soit** `Success<T>` **soit** `Failure<T>`. C'est un objet Dart *scellé* (`sealed class`) — le compilateur nous oblige à traiter les deux cas.

```dart
sealed class Result<T> {}
final class Success<T> extends Result<T> { final T data; }
final class Failure<T> extends Result<T> { final AppException error; }
```

### À quel moment il intervient

Chaque méthode de `PatrimoineRepository` renvoie un `Result` :

```dart
Future<Result<List<SiteModel>>> getSites();
```

Puis, côté Riverpod, l'extension `unwrap()` (dans `core/error/result.dart`) transforme ce `Result` en donnée directe **ou** relance l'exception :

```dart
final sitesProvider = FutureProvider<List<SiteModel>>((ref) async {
  final result = await ref.watch(patrimoineRepositoryProvider).getSites();
  return result.unwrap();   // Success → renvoie la donnée / Failure → relance l'erreur
});
```

Pourquoi relancer l'erreur ici plutôt que la garder encapsulée ? Parce que `FutureProvider` de Riverpod sait nativement transformer une exception en état `AsyncError` — ce qui alimente directement le `.when(loading:, error:, data:)` affiché à l'écran (`shared/async_state_views.dart`).

### Les exceptions typées

`core/error/result.dart` définit une hiérarchie (`TimeoutAppException`, `NoConnectionException`, `UnauthorizedException`, `ServerException`, `NotFoundException`) — chacune porte un **message déjà prêt à afficher à l'utilisateur**, jamais un message technique brut. C'est directement la contre-mesure au problème identifié dans l'audit de l'ancien projet ("Erreur lors de l'ajout" générique, message serveur ignoré).

---

## 4. Riverpod (gestion d'état)

C'est la brique la plus dense conceptuellement. Voici chaque "type" de provider utilisé et **à quel moment** on l'a choisi.

### `Provider` — une valeur simple, sans état changeant

```dart
final patrimoineRepositoryProvider = Provider<PatrimoineRepository>((ref) => PatrimoineRepositoryMock());
```
Utilisé quand on veut juste **injecter une dépendance** (ici : quelle implémentation du repository utiliser). Pas de chargement, pas d'erreur possible, la valeur existe tout de suite.

### `FutureProvider` — une valeur asynchrone qui ne change pas après coup

```dart
final campagneEnCoursProvider = FutureProvider<CampagneModel>((ref) async { ... });
```
Utilisé pour toute donnée **chargée une fois** (au sens : pas modifiée localement ensuite) : sites, campagne, campagnes clôturées, liste des affectataires possibles. Il expose automatiquement 3 états — `loading`, `error`, `data` — via `AsyncValue`, ce qui alimente le `.when(...)` dans chaque écran (voir section 6).

### `FutureProvider.family` — la même chose, mais paramétrée

```dart
final immobilisationProvider = FutureProvider.family<ImmobilisationModel, String>((ref, id) async { ... });
final locauxDuSiteProvider = FutureProvider.family<List<String>, String>((ref, siteId) async { ... });
```
Utilisé quand on a besoin d'une **variante par paramètre** — ici, "la fiche du bien n°X" ou "les locaux du site Y". Chaque valeur de paramètre (`id`, `siteId`) obtient son propre cache indépendant. Appelé ainsi : `ref.watch(immobilisationProvider(widget.immobilisationId))` dans `fiche_detail_screen.dart`.

### `AsyncNotifier` / `AsyncNotifierProvider` — un état asynchrone qui **change** dans le temps

```dart
class ComptagesSessionNotifier extends AsyncNotifier<List<ComptageModel>> {
  Future<List<ComptageModel>> build() async { ... }     // chargement initial
  Future<void> valider(ComptageModel comptage) async { ... }  // action qui modifie l'état
}
final comptagesSessionProvider = AsyncNotifierProvider<ComptagesSessionNotifier, List<ComptageModel>>(ComptagesSessionNotifier.new);
```
C'est la différence clé avec `FutureProvider` : ici on a une **action** (`valider`) qui doit à la fois appeler le repository ET mettre à jour l'état affiché à l'écran, sans tout recharger. C'est exactement le cas de la session d'inventaire : quand on valide un comptage dans `FicheDetailScreen`, tous les écrans qui observent `comptagesSessionProvider` (Accueil, Scanner, Historique) se mettent à jour **automatiquement**, sans code de synchronisation manuel.

### `ref.watch` vs `ref.read`

- **`ref.watch(provider)`** : "je veux être reconstruit si cette valeur change" — utilisé dans les méthodes `build()` des écrans et des providers.
- **`ref.read(provider)`** : "je veux la valeur maintenant, une seule fois, pas d'abonnement" — utilisé dans les callbacks (`onPressed`, `onTap`), par exemple `ref.read(comptagesSessionProvider.notifier).valider(...)` dans `fiche_detail_screen.dart`. Utiliser `watch` dans un callback serait une erreur classique (ça n'a pas de sens de "s'abonner" dans un événement ponctuel).

### `ConsumerWidget` vs `ConsumerStatefulWidget`

- **`ConsumerWidget`** (`AccueilScreen`, `_AccueilContent`) : l'écran n'a besoin d'aucun état local propre, juste de lire des providers → `build(BuildContext, WidgetRef ref)`.
- **`ConsumerStatefulWidget`** (`ScannerScreen`, `HistoriqueScreen`, `FicheDetailScreen`) : l'écran a besoin d'un état local en plus des providers — par exemple le texte tapé dans le champ de saisie manuelle du Scanner, ou les champs modifiés du formulaire de la Fiche détail (`_etat`, `_siteId`...) avant validation. Ce sont volontairement des `setState` locaux et **pas** des providers globaux, parce que cet état est transitoire et propre à l'écran (bonne pratique Riverpod : ne faire remonter en état global que ce qui doit être partagé).

---

## 5. Freezed + json_serializable (modèles de données)

### Le concept

Écrire un modèle de données à la main (comme `fromJson`/`toJson` manuels dans l'ancien projet) est répétitif et source de fautes de frappe. `freezed` génère automatiquement, à partir d'une déclaration courte :
- l'immutabilité (tous les champs `final`)
- `copyWith(...)` (créer une copie avec un champ modifié)
- l'égalité structurelle (`==` et `hashCode` corrects)
- `toString()` lisible

`json_serializable` génère en plus `fromJson`/`toJson` à partir des noms de champs (utile dès que le vrai backend sera branché).

### À quel moment / comment

Chaque fichier dans `data/models/` suit le même schéma :

```dart
@freezed
class SiteModel with _$SiteModel {
  const factory SiteModel({ required String id, ... }) = _SiteModel;
  factory SiteModel.fromJson(Map<String, dynamic> json) => _$SiteModelFromJson(json);
}
```

Les fichiers `*.freezed.dart` et `*.g.dart` sont **générés**, jamais écrits à la main — ils sont produits par la commande :

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Il faut relancer cette commande à chaque fois qu'on modifie un modèle annoté `@freezed`. C'est pour ça que `build_runner`, `freezed` et `json_serializable` sont dans `dev_dependencies` (outils de développement, pas embarqués dans l'app finale).

### Les enums avec `@JsonValue`

Dans `immobilisation_enums.dart` :
```dart
enum EtatBien {
  @JsonValue('horsservice')
  horsService('Hors service'),
  ...
}
```
`@JsonValue('horsservice')` fait le pont entre la valeur texte que le backend enverra (`"horsservice"`, snake/lowercase) et le nom Dart idiomatique (`horsService`, camelCase) — chaque enum porte aussi un `label` humain (`'Hors service'`) pour l'affichage, sans dupliquer cette traduction dans chaque écran.

---

## 6. `AsyncValue.when` — afficher loading / erreur / donnée

### Le concept

Chaque `FutureProvider` ou `AsyncNotifier` expose un `AsyncValue<T>`, qui a exactement 3 états possibles. La méthode `.when(...)` force à gérer les 3 :

```dart
registryAsync.when(
  loading: () => const LoadingView(),
  error: (e, st) => ErrorView(message: '$e', onRetry: () => ref.invalidate(patrimoineRegistryProvider)),
  data: (registry) => _AccueilContent(...),
);
```

### À quel moment

Systématiquement en tête du `build()` de chaque écran, avant d'afficher le contenu réel — c'est ce qui remplace les `bool _isLoading` / `String? _error` gérés manuellement dans l'ancien projet audité. `LoadingView` et `ErrorView` (dans `presentation/shared/async_state_views.dart`) sont les deux widgets réutilisés partout pour rester visuellement cohérents.

Quand deux sources de données sont nécessaires en même temps (ex. Accueil a besoin du *registre* ET de la *session*), on **imbrique** deux `.when(...)` plutôt que de créer un état combiné complexe — plus simple à lire, chaque source garde son cycle de vie propre.

---

## 7. go_router (navigation)

### Le concept

`go_router` remplace le `Navigator.push` classique par un système **déclaratif basé sur des URL/chemins** (`/accueil`, `/scanner`, `/fiche/IMMO-2020-0104`...). Deux notions clés utilisées ici :

- **`ShellRoute`** : une "coquille" commune (ici, la bottom navigation bar) qui englobe plusieurs routes internes sans se recharger elle-même à chaque changement d'onglet.
- **`GoRoute`** avec un segment de chemin dynamique : `/fiche/:id`, où `:id` est récupéré via `state.pathParameters['id']`.

### À quel moment / comment (dans `core/router/app_router.dart`)

```dart
ShellRoute(
  builder: (context, state, child) => PatrimoineShell(child: child),
  routes: [
    GoRoute(path: '/accueil', ...),
    GoRoute(path: '/scanner', ...),
    GoRoute(path: '/historique', ...),
  ],
),
GoRoute(
  path: '/fiche/:id',
  pageBuilder: (context, state) => MaterialPage(fullscreenDialog: true, child: FicheDetailScreen(...)),
),
```

### `context.go(...)` vs `context.push(...)`

- **`context.go('/scanner')`** : change l'onglet actif (remplace la route courante dans la pile du shell) — utilisé pour la bottom nav et pour "Scanner un bien" depuis l'Accueil.
- **`context.push('/fiche/$id')`** : empile une nouvelle route par-dessus, sans quitter l'onglet en dessous — utilisé pour ouvrir la Fiche détail, qui doit pouvoir se fermer (bouton ✕) en revenant exactement là où on était, quel que soit l'onglet de départ. C'est ce qui permet à la Fiche d'être accessible "en modale" depuis les 3 onglets, comme demandé.

---

## 8. Dépendances du projet — rôle de chacune

| Dépendance | Catégorie | Rôle dans le projet | Où on la voit |
|---|---|---|---|
| `flutter_riverpod` | État | Fournit `Provider`, `FutureProvider`, `AsyncNotifier`, `ConsumerWidget`... (section 4) | Partout dans `presentation/` |
| `freezed_annotation` / `freezed` (dev) | Modèles | Génère immutabilité, `copyWith`, égalité (section 5) | `data/models/*.dart` |
| `json_annotation` / `json_serializable` (dev) | Modèles | Génère `fromJson`/`toJson` | `data/models/*.dart` |
| `build_runner` (dev) | Outillage | Moteur qui exécute freezed/json_serializable pour produire le code généré | Commande CLI uniquement |
| `go_router` | Navigation | Routing déclaratif, shell à onglets, routes paramétrées (section 7) | `core/router/app_router.dart` |
| `mobile_scanner` | Fonctionnalité | Accès caméra + décodage QR en direct | `presentation/scanner/scanner_screen.dart` |
| `google_fonts` | UI | Charge les polices Manrope (texte) et JetBrains Mono (nombres/identifiants) du design de référence | `theme/app_theme.dart` |
| `intl` | Formatage | `NumberFormat` pour le séparateur de milliers `fr_FR` (ex. `14 800 000 F`) | `core/format/app_format.dart` |
| `collection` | Utilitaire | Extension `firstOrNull` sur les listes (éviter les exceptions sur liste vide) | Écrans qui cherchent un élément par id (`historique_screen.dart`, `scanner_screen.dart`, `fiche_detail_screen.dart`) |
| `cupertino_icons` | UI | Généré par défaut par `flutter create` (icônes de style iOS) | Non utilisé activement dans ce module (Material Icons utilisées à la place) |
| `flutter_lints` (dev) | Qualité | Règles de lint standard, activées via `analysis_options.yaml`, vérifiées par `dart analyze` | Tout le projet |
| `flutter_test` (dev) | Qualité | Framework de test widget officiel Flutter | `test/widget_test.dart` |

**Dépendances volontairement absentes de cette tâche** (prévues par `CLAUDE.md` mais pas nécessaires ici) : `dio` (client HTTP — inutile en mode 100% mock), `flutter_secure_storage` (stockage du token — aucune auth dans ce module), `hive_flutter` (cache offline — à activer plus tard si besoin terrain confirmé), `mocktail` (mock pour tests unitaires de repository — à ajouter quand on écrira de vrais tests unitaires au-delà du test de fumée actuel).

---

## 9. Qualité de code : `dart analyze` et les tests

### `dart analyze`

Lit tout le code source et signale 3 niveaux de problèmes : `error` (empêche la compilation), `warning` (probable bug — ex. import inutilisé), `info` (style/convention — ex. nom de variable non conforme). Les règles appliquées viennent de `flutter_lints` (configuré dans `analysis_options.yaml`). On l'a fait passer à zéro problème avant de considérer la tâche terminée (règle explicitement demandée et actée dans `CLAUDE.md` section 4).

### `flutter test`

Exécute les tests dans `test/`. Le test actuel (`widget_test.dart`) est un **test de fumée** ("smoke test") : il monte l'application complète dans un environnement de test, attend que tout se stabilise (`pumpAndSettle`), et vérifie que des textes clés de l'écran Accueil apparaissent. Ce n'est pas un test unitaire ciblé (qui testerait une seule classe isolée, ex. `PatrimoineRepositoryMock` seule) — ce niveau de test plus fin est à ajouter plus tard avec `mocktail`, comme prévu dans `CLAUDE.md`.

---

## 10. Convention de nommage utilisée

- Fichiers : `snake_case.dart` (`immobilisation_model.dart`)
- Classes : `PascalCase` (`ImmobilisationModel`)
- Variables/méthodes : `camelCase` (`getImmobilisations`)
- Suffixe `_screen.dart` pour un écran, `_model.dart` pour un modèle de données, `_provider(s).dart` pour les providers Riverpod, `_repository.dart` (interface) / `_repository_mock.dart` (implémentation) pour la couche data.
- Un underscore devant un nom de classe (`_AccueilContent`, `_FicheBody`) signale une classe **privée au fichier**, utilisée uniquement pour découper visuellement un écran trop long — ce n'est pas exposé ailleurs dans le module.
