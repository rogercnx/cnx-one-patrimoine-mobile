/// Type de retour standard des repositories : succès avec donnée, ou échec typé.
/// Voir CLAUDE.md section 2.4 — jamais d'exception brute remontée jusqu'à l'UI.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

final class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppException error;
}

/// Hiérarchie d'exceptions métier — chaque message est prêt à être affiché
/// tel quel à l'utilisateur (jamais de message technique brut dans l'UI).
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class TimeoutAppException extends AppException {
  const TimeoutAppException() : super('Le serveur met trop de temps à répondre.');
}

final class NoConnectionException extends AppException {
  const NoConnectionException() : super('Pas de connexion internet.');
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException() : super('Session expirée, reconnectez-vous.');
}

final class ServerException extends AppException {
  const ServerException(super.message);
}

final class NotFoundException extends AppException {
  const NotFoundException(super.message);
}

/// Déballe un [Result] : renvoie la donnée en cas de succès, relance
/// l'[AppException] sinon — pour laisser `FutureProvider`/`AsyncNotifier`
/// capturer nativement l'échec dans un `AsyncValue.error`.
extension ResultUnwrap<T> on Result<T> {
  T unwrap() => switch (this) {
        Success<T>(:final data) => data,
        Failure<T>(:final error) => throw error,
      };
}
