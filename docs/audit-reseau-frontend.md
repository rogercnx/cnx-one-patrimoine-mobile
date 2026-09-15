# Audit de la couche réseau/API — projet `frontend`

Source auditée : `C:\Users\LENOVO\StudioProjects\frontend`
Objectif : identifier ce qui est réutilisable pour `cnx_one_patrimoine` (backend cible : `backend.zira24.com`)

---

## 1. Structure générale

**Architecture** : pas d'architecture formelle (pas de Clean Architecture, pas de couche domaine séparée). C'est un style **layer-first minimaliste** :

```
lib/
├── main.dart                  # entrée app + routing initial (SplashDecider)
├── models/                    # modèles de données (POJO manuels)
│   ├── categorie.dart
│   └── transaction.dart
├── screens/                   # UI + logique d'appel réseau mêlées (StatefulWidget)
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart       # bottom nav, 5 onglets
│   ├── overview_screen.dart
│   ├── transactions_screen.dart
│   ├── categories_screen.dart
│   ├── statistics_screen.dart
│   └── profile_screen.dart
├── services/                  # couche réseau (le seul vrai "data layer")
│   ├── api_client.dart        # wrapper http générique + gestion token
│   ├── auth_service.dart
│   ├── categorie_service.dart
│   └── transaction_service.dart
├── theme/
└── widgets/
```

Il n'y a **ni `lib/core`, ni `lib/data`, ni `lib/network`, ni `lib/repositories`** — le dossier `services/` fait office de couche data unique (service = à la fois repository et datasource, pas de séparation abstraite/implémentation).

---

## 2. Client HTTP

**Librairie** : [`http`](https://pub.dev/packages/http) (pas Dio, pas Chopper/Retrofit).

**Configuration** : tout est centralisé dans une seule classe `ApiClient` (`lib/services/api_client.dart`) — pas d'interceptors au sens Dio, la logique auth/erreur est répétée manuellement dans chaque méthode (`get`/`post`/`put`/`delete`).

- **Base URL** : codée en dur — `http://10.0.2.2:8000/api/v1` (adresse loopback de l'émulateur Android vers `localhost`). Pas de configuration par environnement (dev/staging/prod), pas de `--dart-define`, pas de `.env`.
- **Timeouts** : **aucun** configuré — les appels `http.get/post/put/delete` utilisent les timeouts par défaut du package (c'est-à-dire aucun timeout applicatif, seulement ceux du socket OS).
- **Injection du JWT** : header `Authorization: Bearer <token>` ajouté manuellement dans `_headers()`, lu depuis `flutter_secure_storage` à chaque requête.
- **Refresh token** : **absent**. Le backend ne semble renvoyer qu'un `access` token (`data['access']` dans `AuthService.login`), aucun `refresh` n'est stocké ni utilisé. Aucune logique de retry/refresh automatique sur 401 — une 401 lève simplement une `UnauthorizedException` que l'UI doit intercepter pour rediriger vers le login.
- **Multi-tenant / tenantSlug** : **absent** — aucun header ni segment d'URL dédié au tenant. Rien à réutiliser ici, à construire pour `cnx_one_patrimoine`.

```dart
// lib/services/api_client.dart (extrait significatif)
class ApiClient {
  static const String baseUrl = 'http://10.0.2.2:8000/api/v1';
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'access_token';

  Future<Map<String, String>> _headers({bool auth = true}) async {
    final headers = {'Content-Type': 'application/json'};
    if (auth) {
      final token = await _storage.read(key: _tokenKey);
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  Future<http.Response> get(String path, {bool auth = true}) async {
    final headers = await _headers(auth: auth);
    final response = await http.get(Uri.parse('$baseUrl$path'), headers: headers);
    if (auth && response.statusCode == 401) {
      throw UnauthorizedException("Session expirée");
    }
    return response;
  }
  // post / put / delete : même schéma répété 4x
}
```

---

## 3. Gestion des erreurs

- **Pas de pattern Either/Result** ni de hiérarchie d'exceptions custom structurée. Une seule exception dédiée : `UnauthorizedException` (pour le 401).
- Pour tout le reste, les services lèvent des `Exception("message en dur")` génériques selon le status code (`!= 200`, `!= 201`, etc.) :
  ```dart
  if (response.statusCode != 200) {
    throw Exception("Identifiants incorrects");
  }
  ```
- **Corps de la réponse d'erreur backend ignoré** — le message d'erreur du serveur (souvent un JSON avec le détail de validation) n'est jamais lu ni affiché ; le message est un texte fixe côté client, déconnecté de la vraie cause.
- **Erreurs réseau (timeout, pas de connexion)** : **non gérées spécifiquement**. Une `SocketException` ou `TimeoutException` remonte telle quelle jusqu'à l'UI (`catch (e)` générique dans les screens), et son `toString()` brut est affiché dans un `SnackBar` — donc l'utilisateur voit un message technique Dart, pas un message métier.
- **Affichage** : `ScaffoldMessenger.showSnackBar(SnackBar(content: Text('$e')))` un peu partout, ou `Text('Erreur : $_error')` dans le body en cas d'échec de chargement initial.

---

## 4. Modèles de données

- **Écriture manuelle**, aucun code-gen (`freezed`/`json_serializable` absents des dépendances).
- Convention : le JSON backend est en **snake_case côté backend mais les champs Dart restent proches du nom backend** (pas de vraie conversion de convention — ex. `categorieId` vient du champ backend `categorie`, pas `categorie_id`), donc le mapping est fait à la main champ par champ, sans convention uniforme.
- Pas de `copyWith`, pas d'égalité structurelle (`==`/`hashCode`), pas d'immutabilité vérifiée par un générateur.

```dart
// lib/models/transaction.dart
class Transaction {
  final int id;
  final double montant;
  final String description;
  final String date; // format 'YYYY-MM-DD' — stocké en String, pas en DateTime
  final int categorieId;

  Transaction({required this.id, required this.montant, required this.description,
    required this.date, required this.categorieId});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'],
    montant: double.parse(json['montant'].toString()), // backend renvoie un string numérique
    description: json['description'] ?? '',
    date: json['date'],
    categorieId: json['categorie'],
  );

  Map<String, dynamic> toJson() => {
    'montant': montant, 'description': description, 'date': date, 'categorie': categorieId,
  };
}
```

---

## 5. Repositories / datasources

- **Aucune abstraction repository** (pas d'interface `TransactionRepository` + implémentation). Chaque `XxxService` (`AuthService`, `CategorieService`, `TransactionService`) instancie directement un `ApiClient()` et appelle l'API — il fait office de repository **et** de datasource en un seul objet concret, appelé directement depuis les widgets `State`.
- **Pas d'injection de dépendances** — chaque service et chaque `ApiClient` est recréé via `ClasseService()` dans chaque écran (pas de singleton, pas de provider global), donc pas de mock possible sans modifier le code.
- **Pas de mock/fake data** : aucune trace de données factices, de flag `useMock`, ou de datasource alternative — le développement s'est fait directement contre le backend réel en local (`10.0.2.2:8000`).

---

## 6. Gestion d'état

- **Aucune librairie de state management** (pas de Bloc, Riverpod, Provider, GetX). Tout est du `StatefulWidget` + `setState`.
- Deux patterns cohabitent selon l'écran :
  - `FutureBuilder` alimenté par un `Future` stocké dans une variable d'état (`late Future<List<Transaction>> _futureTransactions`), reconstruit en réassignant la variable dans un `setState` (`_refresh()`).
  - Chargement impératif dans `initState()` avec `try/catch` manuel, puis `setState(() { _data = ...; _isLoading = false; })` (ex. `ProfileScreen`).
- Loading géré par un booléen `_isLoading` local à chaque écran ; erreur par une variable `_error` locale ; pas d'état partagé/global (pas de "auth state" observable par le reste de l'app — chaque écran revérifie lui-même via `AuthService().isLoggedIn()` ou attrape `UnauthorizedException`).

---

## 7. Stockage local

- **Token** : persisté via `flutter_secure_storage` (Keychain/Keystore natif) — bonne pratique conservée. Une seule clé `access_token`, pas de refresh token stocké.
- **Cache de données** : **aucun** — pas de Hive/SQLite/Drift/Isar. Chaque écran refait un appel réseau à chaque `initState`/pull-to-refresh ; aucune donnée n'est disponible hors-ligne.

---

## 8. Authentification

**Flow complet** :

1. `main.dart` → `SplashDecider` appelle `AuthService().isLoggedIn()` (présence d'un token en secure storage, **pas de vérification de validité/expiration**) et route vers `HomeScreen` ou `LoginScreen`.
2. `LoginScreen` → `AuthService.login(username, password)` → `POST /auth/login/` sans header auth → si 200, sauvegarde `data['access']` dans secure storage → `Navigator.pushReplacement` vers `HomeScreen`.
3. `RegisterScreen` → `POST /auth/register/` → si 201, retour au login avec un SnackBar de confirmation (pas de connexion automatique post-inscription).
4. **Déconnexion automatique sur expiration** : partielle et non centralisée. Chaque écran qui appelle l'API doit lui-même attraper `UnauthorizedException` et rediriger vers `LoginScreen` (ex. dans `TransactionsScreen._loadData`/`_refresh`) — **beaucoup d'écrans ne le font pas** (ex. `CategorieService`, `ProfileScreen` n'attrapent pas spécifiquement ce cas), donc un token expiré affiche une erreur générique au lieu de rediriger.
5. **Logout manuel** : bouton dans `ProfileScreen` → `AuthService().logout()` (supprime juste le token) → redirection vers `LoginScreen`.

Aucun refresh silencieux : quand l'access token expire, l'utilisateur est simplement renvoyé au login (aucune session longue durée gérée).

---

## 9. Points réutilisables directement

| Élément | Fichier source | Ce qu'il apporte | À adapter avant réemploi |
|---|---|---|---|
| Pattern secure storage pour le token | `api_client.dart` (`_storage`, `saveToken`/`deleteToken`/`readToken`) | Bonne pratique : token jamais en `SharedPreferences` | Ajouter le stockage d'un refresh token si le nouveau backend en fournit un |
| `UnauthorizedException` + détection 401 | `api_client.dart` | Squelette de détection de session expirée | À faire déclencher automatiquement une déconnexion globale plutôt qu'un `throw` que chaque écran doit gérer soi-même |
| Séparation par ressource des services (`XxxService`) | `services/*.dart` | Découpage simple et lisible par domaine métier | À faire hériter d'une interface abstraite pour permettre le mock en test |
| `factory fromJson` / `toJson` manuels | `models/*.dart` | Fonctionnel, lisible | Remplacer par `freezed` + `json_serializable` pour l'immutabilité, `copyWith`, moins de bugs de mapping |
| Flow `SplashDecider` (redirection selon session) | `main.dart` | Bonne base pour le routing initial | Ajouter une vraie vérification de validité du token (pas juste sa présence) |

**Rien d'autre n'est à copier tel quel** : le `ApiClient` doit être réécrit en profondeur (voir section 10) plutôt que repris tel quel — sa structure générale (une classe façade avec `get/post/put/delete`) reste un bon point de départ conceptuel, mais son contenu (pas de base URL configurable, pas de timeout, pas de refresh, pas de gestion d'erreur exploitable) ne doit pas être dupliqué.

---

## 10. Points à améliorer — à ne PAS reproduire dans `cnx_one_patrimoine`

1. **Base URL codée en dur** (`http://10.0.2.2:8000/api/v1`) dans le code source, sans distinction dev/staging/prod. → Utiliser `--dart-define` / `flutter_dotenv` / des flavors, avec `backend.zira24.com` configurable par environnement.
2. **Aucun timeout réseau** — un backend qui ne répond pas bloque l'UI indéfiniment (le `CircularProgressIndicator` ne s'arrête jamais). → Fixer des timeouts explicites (`connectTimeout`, `receiveTimeout`).
3. **Pas de refresh token / pas de renouvellement de session** — l'utilisateur est déconnecté dès l'expiration du court-lived access token, sans tentative de refresh silencieux. → Si le backend Zira24 expose un refresh token, l'implémenter avec un interceptor qui retente automatiquement la requête après renouvellement.
4. **Détection du 401 non centralisée** — chaque écran doit se souvenir d'attraper `UnauthorizedException` ; plusieurs (ex. `ProfileScreen`, `CategorieService`) ne le font pas et affichent une erreur brute au lieu de rediriger vers le login. → Centraliser la déconnexion automatique dans le client HTTP (stream/callback global écouté par la racine de l'app), pas dans chaque écran.
5. **Messages d'erreur backend ignorés** — le corps JSON de la réponse d'erreur (souvent riche : erreurs de validation par champ) n'est jamais parsé ; les messages affichés sont des chaînes fixes côté client (`"Erreur lors de l'ajout"`). → Parser le corps d'erreur et remonter le vrai message serveur à l'utilisateur.
6. **Erreurs réseau non catégorisées** — `SocketException`/`TimeoutException`/`FormatException` remontent brutes jusqu'à `Text('$e')` dans l'UI, affichant potentiellement des messages techniques en anglais à l'utilisateur final. → Wrapper ces exceptions dans des types métier (`NetworkException`, `TimeoutException` custom) avec des messages traduits.
7. **Pas de couche d'abstraction repository** — les widgets appellent directement des services concrets instanciés en local (`final _authService = AuthService();` dans chaque `State`), donc impossible à tester unitairement ou à mocker. → Introduire une interface + injection de dépendances (au minimum un `Provider`/`Riverpod`, ou fournir les services via constructeur).
8. **Aucune gestion d'état partagée pour l'auth** — la session n'est pas observable globalement ; chaque écran revérifie la présence du token à sa manière. → Un `AuthState`/`AuthController` global notifié à la connexion/déconnexion évite les incohérences (ex. bottom nav visible après logout dans un autre onglet).
9. **Pas de mock/fake datasource** pour développer avant que les routes backend existent — bloquant si le backend Zira24 n'est pas encore prêt sur certaines routes lors du développement du nouveau projet. → Prévoir dès le départ une datasource fake activable par flag/environnement.
10. **Aucune limite de tentatives ni verrouillage** sur le login (pas nécessairement un problème pour un projet perso, mais à ne pas reproduire tel quel dans un contexte "patrimoine" avec des données sensibles) — pas de rate limiting côté client, pas de gestion des comptes verrous.
11. **Pas de gestion multi-tenant** — si `cnx_one_patrimoine` doit gérer un `tenantSlug` (mentionné dans votre besoin), il n'y a **aucun précédent** à réutiliser ici ; il faudra le concevoir en même temps que le nouveau `ApiClient` (header dédié, ex. `X-Tenant-Slug`, ou sous-domaine/segment d'URL).

---

## Recommandation pour `cnx_one_patrimoine`

Étant donné le niveau réel de maturité de ce projet existant (prototype fonctionnel simple, sans patterns robustes de production), je recommande de **ne pas répliquer l'architecture telle quelle**. Gardez uniquement : le choix `flutter_secure_storage` pour le token, l'idée d'une façade HTTP unique, et le découpage service-par-ressource. Concevez en revanche une base neuve avec : client HTTP configurable par environnement + timeouts, gestion centralisée du 401/refresh, exceptions typées avec messages serveur exploités, et une vraie séparation repository/datasource testable — surtout compte tenu du contexte patrimoine (données sensibles) et du besoin multi-tenant absent ici.
