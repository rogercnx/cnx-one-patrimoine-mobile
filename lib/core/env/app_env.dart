/// Configuration par environnement — jamais de base URL codée en dur ailleurs
/// que cette valeur par défaut documentée (CLAUDE.md règle de collaboration).
///
/// Pour pointer vers un autre environnement :
/// ```
/// flutter run --dart-define=API_BASE_URL=https://staging.zira24.com/api/v1
/// ```
abstract final class AppEnv {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://backend.zira24.com/api/v1',
  );
}
