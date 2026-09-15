import 'package:dio/dio.dart';

import '../error/result.dart';

/// Transforme une [DioException] brute en [AppException] typée, avec un
/// message toujours prêt à afficher à l'utilisateur (jamais un message Dart
/// technique). Les types [TimeoutAppException], [NoConnectionException],
/// [UnauthorizedException], [ServerException] et [NotFoundException] sont
/// définis une seule fois dans `core/error/result.dart` — partagés avec le
/// module Patrimoine — plutôt que dupliqués ici.
///
/// Forme des erreurs du backend Zira24, vérifiée par appel réel :
/// `{ "error": "CODE_MACHINE", "message": "Message humain (souvent en français)" }`
/// parfois avec un `statusCode` en plus (ex. 401 levé par le framework avant
/// d'atteindre le contrôleur). On donne toujours la priorité à `message`.
AppException mapDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutAppException();

    case DioExceptionType.connectionError:
      return const NoConnectionException();

    case DioExceptionType.badCertificate:
      return const ServerException('Connexion sécurisée impossible avec le serveur.');

    case DioExceptionType.cancel:
      return const ServerException('Requête annulée.');

    case DioExceptionType.badResponse:
      return _mapBadResponse(exception);

    case DioExceptionType.unknown:
      return const NoConnectionException();
  }
}

AppException _mapBadResponse(DioException exception) {
  final statusCode = exception.response?.statusCode;
  final message = _extractServerMessage(exception.response?.data);

  if (statusCode == 401) {
    return const UnauthorizedException();
  }
  if (statusCode == 404) {
    return NotFoundException(message ?? 'Ressource introuvable.');
  }
  return ServerException(message ?? 'Le serveur a rencontré une erreur. Réessayez plus tard.');
}

String? _extractServerMessage(Object? responseData) {
  if (responseData is Map) {
    final message = responseData['message'];
    if (message is String && message.isNotEmpty) return message;
    final error = responseData['error'];
    if (error is String && error.isNotEmpty) return error;
  }
  return null;
}
