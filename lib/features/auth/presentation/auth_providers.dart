import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/auth_interceptor.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../data/auth_repository_impl.dart';
import '../domain/auth_repository.dart';
import 'auth_controller.dart';

/// Injection de dépendances du module Auth (CLAUDE.md section 5) :
/// stockage sécurisé, client Dio partagé (avec l'intercepteur d'auth), et
/// le repository — toujours l'implémentation réelle ici, pas de mock.

final secureStorageProvider = Provider<SecureStorageService>((ref) => const SecureStorageService());

final dioProvider = Provider<Dio>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final interceptor = AuthInterceptor(
    secureStorage: secureStorage,
    // Lecture différée : authControllerProvider n'est résolu qu'au moment
    // réel d'un refresh échoué, jamais pendant la construction de dioProvider.
    onSessionExpired: () => ref.read(authControllerProvider.notifier).forceSignOut(),
  );
  final dio = ApiClient.create(interceptors: [interceptor]);
  interceptor.attachDio(dio);
  return dio;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    dio: ref.watch(dioProvider),
    secureStorage: ref.watch(secureStorageProvider),
  );
});
