// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offre_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OffreInput _$OffreInputFromJson(Map<String, dynamic> json) {
  return _OffreInput.fromJson(json);
}

/// @nodoc
mixin _$OffreInput {
  String get fournisseur => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get montant => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get delai => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get observation => throw _privateConstructorUsedError;

  /// Serializes this OffreInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OffreInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OffreInputCopyWith<OffreInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffreInputCopyWith<$Res> {
  factory $OffreInputCopyWith(
    OffreInput value,
    $Res Function(OffreInput) then,
  ) = _$OffreInputCopyWithImpl<$Res, OffreInput>;
  @useResult
  $Res call({
    String fournisseur,
    @JsonKey(includeIfNull: false) double? montant,
    @JsonKey(includeIfNull: false) String? delai,
    @JsonKey(includeIfNull: false) String? observation,
  });
}

/// @nodoc
class _$OffreInputCopyWithImpl<$Res, $Val extends OffreInput>
    implements $OffreInputCopyWith<$Res> {
  _$OffreInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OffreInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fournisseur = null,
    Object? montant = freezed,
    Object? delai = freezed,
    Object? observation = freezed,
  }) {
    return _then(
      _value.copyWith(
            fournisseur: null == fournisseur
                ? _value.fournisseur
                : fournisseur // ignore: cast_nullable_to_non_nullable
                      as String,
            montant: freezed == montant
                ? _value.montant
                : montant // ignore: cast_nullable_to_non_nullable
                      as double?,
            delai: freezed == delai
                ? _value.delai
                : delai // ignore: cast_nullable_to_non_nullable
                      as String?,
            observation: freezed == observation
                ? _value.observation
                : observation // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OffreInputImplCopyWith<$Res>
    implements $OffreInputCopyWith<$Res> {
  factory _$$OffreInputImplCopyWith(
    _$OffreInputImpl value,
    $Res Function(_$OffreInputImpl) then,
  ) = __$$OffreInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String fournisseur,
    @JsonKey(includeIfNull: false) double? montant,
    @JsonKey(includeIfNull: false) String? delai,
    @JsonKey(includeIfNull: false) String? observation,
  });
}

/// @nodoc
class __$$OffreInputImplCopyWithImpl<$Res>
    extends _$OffreInputCopyWithImpl<$Res, _$OffreInputImpl>
    implements _$$OffreInputImplCopyWith<$Res> {
  __$$OffreInputImplCopyWithImpl(
    _$OffreInputImpl _value,
    $Res Function(_$OffreInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OffreInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fournisseur = null,
    Object? montant = freezed,
    Object? delai = freezed,
    Object? observation = freezed,
  }) {
    return _then(
      _$OffreInputImpl(
        fournisseur: null == fournisseur
            ? _value.fournisseur
            : fournisseur // ignore: cast_nullable_to_non_nullable
                  as String,
        montant: freezed == montant
            ? _value.montant
            : montant // ignore: cast_nullable_to_non_nullable
                  as double?,
        delai: freezed == delai
            ? _value.delai
            : delai // ignore: cast_nullable_to_non_nullable
                  as String?,
        observation: freezed == observation
            ? _value.observation
            : observation // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OffreInputImpl implements _OffreInput {
  const _$OffreInputImpl({
    required this.fournisseur,
    @JsonKey(includeIfNull: false) this.montant,
    @JsonKey(includeIfNull: false) this.delai,
    @JsonKey(includeIfNull: false) this.observation,
  });

  factory _$OffreInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$OffreInputImplFromJson(json);

  @override
  final String fournisseur;
  @override
  @JsonKey(includeIfNull: false)
  final double? montant;
  @override
  @JsonKey(includeIfNull: false)
  final String? delai;
  @override
  @JsonKey(includeIfNull: false)
  final String? observation;

  @override
  String toString() {
    return 'OffreInput(fournisseur: $fournisseur, montant: $montant, delai: $delai, observation: $observation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffreInputImpl &&
            (identical(other.fournisseur, fournisseur) ||
                other.fournisseur == fournisseur) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.delai, delai) || other.delai == delai) &&
            (identical(other.observation, observation) ||
                other.observation == observation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fournisseur, montant, delai, observation);

  /// Create a copy of OffreInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OffreInputImplCopyWith<_$OffreInputImpl> get copyWith =>
      __$$OffreInputImplCopyWithImpl<_$OffreInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OffreInputImplToJson(this);
  }
}

abstract class _OffreInput implements OffreInput {
  const factory _OffreInput({
    required final String fournisseur,
    @JsonKey(includeIfNull: false) final double? montant,
    @JsonKey(includeIfNull: false) final String? delai,
    @JsonKey(includeIfNull: false) final String? observation,
  }) = _$OffreInputImpl;

  factory _OffreInput.fromJson(Map<String, dynamic> json) =
      _$OffreInputImpl.fromJson;

  @override
  String get fournisseur;
  @override
  @JsonKey(includeIfNull: false)
  double? get montant;
  @override
  @JsonKey(includeIfNull: false)
  String? get delai;
  @override
  @JsonKey(includeIfNull: false)
  String? get observation;

  /// Create a copy of OffreInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OffreInputImplCopyWith<_$OffreInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
