// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attribution_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AttributionModel _$AttributionModelFromJson(Map<String, dynamic> json) {
  return _AttributionModel.fromJson(json);
}

/// @nodoc
mixin _$AttributionModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'immobilisation_id')
  String? get immobilisationId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get detenteur => throw _privateConstructorUsedError;
  String get lieu => throw _privateConstructorUsedError;
  String get motif => throw _privateConstructorUsedError;
  @JsonKey(name: 'acte_reference')
  String get acteReference => throw _privateConstructorUsedError;

  /// Serializes this AttributionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttributionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttributionModelCopyWith<AttributionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributionModelCopyWith<$Res> {
  factory $AttributionModelCopyWith(
    AttributionModel value,
    $Res Function(AttributionModel) then,
  ) = _$AttributionModelCopyWithImpl<$Res, AttributionModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    DateTime date,
    String detenteur,
    String lieu,
    String motif,
    @JsonKey(name: 'acte_reference') String acteReference,
  });
}

/// @nodoc
class _$AttributionModelCopyWithImpl<$Res, $Val extends AttributionModel>
    implements $AttributionModelCopyWith<$Res> {
  _$AttributionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttributionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? immobilisationId = freezed,
    Object? date = null,
    Object? detenteur = null,
    Object? lieu = null,
    Object? motif = null,
    Object? acteReference = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            immobilisationId: freezed == immobilisationId
                ? _value.immobilisationId
                : immobilisationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            detenteur: null == detenteur
                ? _value.detenteur
                : detenteur // ignore: cast_nullable_to_non_nullable
                      as String,
            lieu: null == lieu
                ? _value.lieu
                : lieu // ignore: cast_nullable_to_non_nullable
                      as String,
            motif: null == motif
                ? _value.motif
                : motif // ignore: cast_nullable_to_non_nullable
                      as String,
            acteReference: null == acteReference
                ? _value.acteReference
                : acteReference // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttributionModelImplCopyWith<$Res>
    implements $AttributionModelCopyWith<$Res> {
  factory _$$AttributionModelImplCopyWith(
    _$AttributionModelImpl value,
    $Res Function(_$AttributionModelImpl) then,
  ) = __$$AttributionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'immobilisation_id') String? immobilisationId,
    DateTime date,
    String detenteur,
    String lieu,
    String motif,
    @JsonKey(name: 'acte_reference') String acteReference,
  });
}

/// @nodoc
class __$$AttributionModelImplCopyWithImpl<$Res>
    extends _$AttributionModelCopyWithImpl<$Res, _$AttributionModelImpl>
    implements _$$AttributionModelImplCopyWith<$Res> {
  __$$AttributionModelImplCopyWithImpl(
    _$AttributionModelImpl _value,
    $Res Function(_$AttributionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttributionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? immobilisationId = freezed,
    Object? date = null,
    Object? detenteur = null,
    Object? lieu = null,
    Object? motif = null,
    Object? acteReference = null,
  }) {
    return _then(
      _$AttributionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        immobilisationId: freezed == immobilisationId
            ? _value.immobilisationId
            : immobilisationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        detenteur: null == detenteur
            ? _value.detenteur
            : detenteur // ignore: cast_nullable_to_non_nullable
                  as String,
        lieu: null == lieu
            ? _value.lieu
            : lieu // ignore: cast_nullable_to_non_nullable
                  as String,
        motif: null == motif
            ? _value.motif
            : motif // ignore: cast_nullable_to_non_nullable
                  as String,
        acteReference: null == acteReference
            ? _value.acteReference
            : acteReference // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributionModelImpl implements _AttributionModel {
  const _$AttributionModelImpl({
    required this.id,
    @JsonKey(name: 'immobilisation_id') this.immobilisationId,
    required this.date,
    required this.detenteur,
    required this.lieu,
    required this.motif,
    @JsonKey(name: 'acte_reference') required this.acteReference,
  });

  factory _$AttributionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributionModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'immobilisation_id')
  final String? immobilisationId;
  @override
  final DateTime date;
  @override
  final String detenteur;
  @override
  final String lieu;
  @override
  final String motif;
  @override
  @JsonKey(name: 'acte_reference')
  final String acteReference;

  @override
  String toString() {
    return 'AttributionModel(id: $id, immobilisationId: $immobilisationId, date: $date, detenteur: $detenteur, lieu: $lieu, motif: $motif, acteReference: $acteReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.immobilisationId, immobilisationId) ||
                other.immobilisationId == immobilisationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.detenteur, detenteur) ||
                other.detenteur == detenteur) &&
            (identical(other.lieu, lieu) || other.lieu == lieu) &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.acteReference, acteReference) ||
                other.acteReference == acteReference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    immobilisationId,
    date,
    detenteur,
    lieu,
    motif,
    acteReference,
  );

  /// Create a copy of AttributionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributionModelImplCopyWith<_$AttributionModelImpl> get copyWith =>
      __$$AttributionModelImplCopyWithImpl<_$AttributionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributionModelImplToJson(this);
  }
}

abstract class _AttributionModel implements AttributionModel {
  const factory _AttributionModel({
    required final String id,
    @JsonKey(name: 'immobilisation_id') final String? immobilisationId,
    required final DateTime date,
    required final String detenteur,
    required final String lieu,
    required final String motif,
    @JsonKey(name: 'acte_reference') required final String acteReference,
  }) = _$AttributionModelImpl;

  factory _AttributionModel.fromJson(Map<String, dynamic> json) =
      _$AttributionModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'immobilisation_id')
  String? get immobilisationId;
  @override
  DateTime get date;
  @override
  String get detenteur;
  @override
  String get lieu;
  @override
  String get motif;
  @override
  @JsonKey(name: 'acte_reference')
  String get acteReference;

  /// Create a copy of AttributionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttributionModelImplCopyWith<_$AttributionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
