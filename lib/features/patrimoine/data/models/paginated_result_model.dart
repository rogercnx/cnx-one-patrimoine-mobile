import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_result_model.freezed.dart';
part 'paginated_result_model.g.dart';

/// Enveloppe de pagination générique — confirmée par appel réel sur
/// `GET /patrimoine/immobilisations` : `{ "data": [...], "total": 0,
/// "page": 1, "limit": 20 }`. À réutiliser pour toute liste paginée du
/// backend plutôt que de dupliquer cette structure par endpoint.
@Freezed(genericArgumentFactories: true)
class PaginatedResult<T> with _$PaginatedResult<T> {
  const factory PaginatedResult({
    required List<T> data,
    required int total,
    required int page,
    required int limit,
  }) = _PaginatedResult<T>;

  factory PaginatedResult.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginatedResultFromJson(json, fromJsonT);
}
