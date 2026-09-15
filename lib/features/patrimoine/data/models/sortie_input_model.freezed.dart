// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sortie_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JustificatifInput _$JustificatifInputFromJson(Map<String, dynamic> json) {
  return _JustificatifInput.fromJson(json);
}

/// @nodoc
mixin _$JustificatifInput {
  String get libelle => throw _privateConstructorUsedError;
  StatutJustificatif get statut => throw _privateConstructorUsedError;

  /// Serializes this JustificatifInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JustificatifInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JustificatifInputCopyWith<JustificatifInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JustificatifInputCopyWith<$Res> {
  factory $JustificatifInputCopyWith(
    JustificatifInput value,
    $Res Function(JustificatifInput) then,
  ) = _$JustificatifInputCopyWithImpl<$Res, JustificatifInput>;
  @useResult
  $Res call({String libelle, StatutJustificatif statut});
}

/// @nodoc
class _$JustificatifInputCopyWithImpl<$Res, $Val extends JustificatifInput>
    implements $JustificatifInputCopyWith<$Res> {
  _$JustificatifInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JustificatifInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? libelle = null, Object? statut = null}) {
    return _then(
      _value.copyWith(
            libelle: null == libelle
                ? _value.libelle
                : libelle // ignore: cast_nullable_to_non_nullable
                      as String,
            statut: null == statut
                ? _value.statut
                : statut // ignore: cast_nullable_to_non_nullable
                      as StatutJustificatif,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JustificatifInputImplCopyWith<$Res>
    implements $JustificatifInputCopyWith<$Res> {
  factory _$$JustificatifInputImplCopyWith(
    _$JustificatifInputImpl value,
    $Res Function(_$JustificatifInputImpl) then,
  ) = __$$JustificatifInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String libelle, StatutJustificatif statut});
}

/// @nodoc
class __$$JustificatifInputImplCopyWithImpl<$Res>
    extends _$JustificatifInputCopyWithImpl<$Res, _$JustificatifInputImpl>
    implements _$$JustificatifInputImplCopyWith<$Res> {
  __$$JustificatifInputImplCopyWithImpl(
    _$JustificatifInputImpl _value,
    $Res Function(_$JustificatifInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JustificatifInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? libelle = null, Object? statut = null}) {
    return _then(
      _$JustificatifInputImpl(
        libelle: null == libelle
            ? _value.libelle
            : libelle // ignore: cast_nullable_to_non_nullable
                  as String,
        statut: null == statut
            ? _value.statut
            : statut // ignore: cast_nullable_to_non_nullable
                  as StatutJustificatif,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JustificatifInputImpl implements _JustificatifInput {
  const _$JustificatifInputImpl({required this.libelle, required this.statut});

  factory _$JustificatifInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$JustificatifInputImplFromJson(json);

  @override
  final String libelle;
  @override
  final StatutJustificatif statut;

  @override
  String toString() {
    return 'JustificatifInput(libelle: $libelle, statut: $statut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JustificatifInputImpl &&
            (identical(other.libelle, libelle) || other.libelle == libelle) &&
            (identical(other.statut, statut) || other.statut == statut));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, libelle, statut);

  /// Create a copy of JustificatifInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JustificatifInputImplCopyWith<_$JustificatifInputImpl> get copyWith =>
      __$$JustificatifInputImplCopyWithImpl<_$JustificatifInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JustificatifInputImplToJson(this);
  }
}

abstract class _JustificatifInput implements JustificatifInput {
  const factory _JustificatifInput({
    required final String libelle,
    required final StatutJustificatif statut,
  }) = _$JustificatifInputImpl;

  factory _JustificatifInput.fromJson(Map<String, dynamic> json) =
      _$JustificatifInputImpl.fromJson;

  @override
  String get libelle;
  @override
  StatutJustificatif get statut;

  /// Create a copy of JustificatifInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JustificatifInputImplCopyWith<_$JustificatifInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SortieInput _$SortieInputFromJson(Map<String, dynamic> json) {
  return _SortieInput.fromJson(json);
}

/// @nodoc
mixin _$SortieInput {
  MotifSortie get motif => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  List<JustificatifInput>? get justificatifs =>
      throw _privateConstructorUsedError;

  /// Serializes this SortieInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SortieInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SortieInputCopyWith<SortieInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortieInputCopyWith<$Res> {
  factory $SortieInputCopyWith(
    SortieInput value,
    $Res Function(SortieInput) then,
  ) = _$SortieInputCopyWithImpl<$Res, SortieInput>;
  @useResult
  $Res call({
    MotifSortie motif,
    @JsonKey(includeIfNull: false) List<JustificatifInput>? justificatifs,
  });
}

/// @nodoc
class _$SortieInputCopyWithImpl<$Res, $Val extends SortieInput>
    implements $SortieInputCopyWith<$Res> {
  _$SortieInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SortieInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? motif = null, Object? justificatifs = freezed}) {
    return _then(
      _value.copyWith(
            motif: null == motif
                ? _value.motif
                : motif // ignore: cast_nullable_to_non_nullable
                      as MotifSortie,
            justificatifs: freezed == justificatifs
                ? _value.justificatifs
                : justificatifs // ignore: cast_nullable_to_non_nullable
                      as List<JustificatifInput>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SortieInputImplCopyWith<$Res>
    implements $SortieInputCopyWith<$Res> {
  factory _$$SortieInputImplCopyWith(
    _$SortieInputImpl value,
    $Res Function(_$SortieInputImpl) then,
  ) = __$$SortieInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MotifSortie motif,
    @JsonKey(includeIfNull: false) List<JustificatifInput>? justificatifs,
  });
}

/// @nodoc
class __$$SortieInputImplCopyWithImpl<$Res>
    extends _$SortieInputCopyWithImpl<$Res, _$SortieInputImpl>
    implements _$$SortieInputImplCopyWith<$Res> {
  __$$SortieInputImplCopyWithImpl(
    _$SortieInputImpl _value,
    $Res Function(_$SortieInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SortieInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? motif = null, Object? justificatifs = freezed}) {
    return _then(
      _$SortieInputImpl(
        motif: null == motif
            ? _value.motif
            : motif // ignore: cast_nullable_to_non_nullable
                  as MotifSortie,
        justificatifs: freezed == justificatifs
            ? _value._justificatifs
            : justificatifs // ignore: cast_nullable_to_non_nullable
                  as List<JustificatifInput>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SortieInputImpl implements _SortieInput {
  const _$SortieInputImpl({
    required this.motif,
    @JsonKey(includeIfNull: false) final List<JustificatifInput>? justificatifs,
  }) : _justificatifs = justificatifs;

  factory _$SortieInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$SortieInputImplFromJson(json);

  @override
  final MotifSortie motif;
  final List<JustificatifInput>? _justificatifs;
  @override
  @JsonKey(includeIfNull: false)
  List<JustificatifInput>? get justificatifs {
    final value = _justificatifs;
    if (value == null) return null;
    if (_justificatifs is EqualUnmodifiableListView) return _justificatifs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SortieInput(motif: $motif, justificatifs: $justificatifs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortieInputImpl &&
            (identical(other.motif, motif) || other.motif == motif) &&
            const DeepCollectionEquality().equals(
              other._justificatifs,
              _justificatifs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    motif,
    const DeepCollectionEquality().hash(_justificatifs),
  );

  /// Create a copy of SortieInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SortieInputImplCopyWith<_$SortieInputImpl> get copyWith =>
      __$$SortieInputImplCopyWithImpl<_$SortieInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SortieInputImplToJson(this);
  }
}

abstract class _SortieInput implements SortieInput {
  const factory _SortieInput({
    required final MotifSortie motif,
    @JsonKey(includeIfNull: false) final List<JustificatifInput>? justificatifs,
  }) = _$SortieInputImpl;

  factory _SortieInput.fromJson(Map<String, dynamic> json) =
      _$SortieInputImpl.fromJson;

  @override
  MotifSortie get motif;
  @override
  @JsonKey(includeIfNull: false)
  List<JustificatifInput>? get justificatifs;

  /// Create a copy of SortieInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SortieInputImplCopyWith<_$SortieInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
