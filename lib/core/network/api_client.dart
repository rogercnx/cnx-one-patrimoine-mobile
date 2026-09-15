import 'package:dio/dio.dart';

import '../env/app_env.dart';

/// Fabrique du client HTTP — Dio configuré (base URL, timeouts), sans
/// dépendance à Riverpod : les intercepteurs sont injectés depuis
/// l'extérieur (voir `features/auth/presentation/auth_providers.dart`),
/// ce qui garde ce fichier testable isolément.
abstract final class ApiClient {
  static Dio create({List<Interceptor> interceptors = const []}) {
    final dio = Dio(BaseOptions(
      baseUrl: AppEnv.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
    ));
    dio.interceptors.addAll(interceptors);
    return dio;
  }
}
