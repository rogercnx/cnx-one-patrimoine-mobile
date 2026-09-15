// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comptage_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ComptageInput _$ComptageInputFromJson(Map<String, dynamic> json) {
  return _ComptageInput.fromJson(json);
}

/// @nodoc
mixin _$ComptageInput {
  @JsonKey(includeIfNull: false)
  String? get immobilisationId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  ResultatInventaire? get resultat => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  EtatBien? get etatConstate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get siteConstate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get affectataireConstate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this ComptageInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComptageInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComptageInputCopyWith<ComptageInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComptageInputCopyWith<$Res> {
  factory $ComptageInputCopyWith(
    ComptageInput value,
    $Res Function(ComptageInput) then,
  ) = _$ComptageInputCopyWithImpl<$Res, ComptageInput>;
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) String? immobilisationId,
    @JsonKey(includeIfNull: false) ResultatInventaire? resultat,
    @JsonKey(includeIfNull: false) EtatBien? etatConstate,
    @JsonKey(includeIfNull: false) String? siteConstate,
    @JsonKey(includeIfNull: false) String? affectataireConstate,
    @JsonKey(includeIfNull: false) String? note,
  });
}

/// @nodoc
class _$ComptageInputCopyWithImpl<$Res, $Val extends ComptageInput>
    implements $ComptageInputCopyWith<$Res> {
  _$ComptageInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComptageInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immobilisationId = freezed,
    Object? resultat = freezed,
    Object? etatConstate = freezed,
    Object? siteConstate = freezed,
    Object? affectataireConstate = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            immobilisationId: freezed == immobilisationId
                ? _value.immobilisationId
                : immobilisationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            resultat: freezed == resultat
                ? _value.resultat
                : resultat // ignore: cast_nullable_to_non_nullable
                      as ResultatInventaire?,
            etatConstate: freezed == etatConstate
                ? _value.etatConstate
                : etatConstate // ignore: cast_nullable_to_non_nullable
                      as EtatBien?,
            siteConstate: freezed == siteConstate
                ? _value.siteConstate
                : siteConstate // ignore: cast_nullable_to_non_nullable
                      as String?,
            affectataireConstate: freezed == affectataireConstate
                ? _value.affectataireConstate
                : affectataireConstate // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ComptageInputImplCopyWith<$Res>
    implements $ComptageInputCopyWith<$Res> {
  factory _$$ComptageInputImplCopyWith(
    _$ComptageInputImpl value,
    $Res Function(_$ComptageInputImpl) then,
  ) = __$$ComptageInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeIfNull: false) String? immobilisationId,
    @JsonKey(includeIfNull: false) ResultatInventaire? resultat,
    @JsonKey(includeIfNull: false) EtatBien? etatConstate,
    @JsonKey(includeIfNull: false) String? siteConstate,
    @JsonKey(includeIfNull: false) String? affectataireConstate,
    @JsonKey(includeIfNull: false) String? note,
  });
}

/// @nodoc
class __$$ComptageInputImplCopyWithImpl<$Res>
    extends _$ComptageInputCopyWithImpl<$Res, _$ComptageInputImpl>
    implements _$$ComptageInputImplCopyWith<$Res> {
  __$$ComptageInputImplCopyWithImpl(
    _$ComptageInputImpl _value,
    $Res Function(_$ComptageInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComptageInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immobilisationId = freezed,
    Object? resultat = freezed,
    Object? etatConstate = freezed,
    Object? siteConstate = freezed,
    Object? affectataireConstate = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$ComptageInputImpl(
        immobilisationId: freezed == immobilisationId
            ? _value.immobilisationId
            : immobilisationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        resultat: freezed == resultat
            ? _value.resultat
            : resultat // ignore: cast_nullable_to_non_nullable
                  as ResultatInventaire?,
        etatConstate: freezed == etatConstate
            ? _value.etatConstate
            : etatConstate // ignore: cast_nullable_to_non_nullable
                  as EtatBien?,
        siteConstate: freezed == siteConstate
            ? _value.siteConstate
            : siteConstate // ignore: cast_nullable_to_non_nullable
                  as String?,
        affectataireConstate: freezed == affectataireConstate
            ? _value.affectataireConstate
            : affectataireConstate // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ComptageInputImpl implements _ComptageInput {
  const _$ComptageInputImpl({
    @JsonKey(includeIfNull: false) this.immobilisationId,
    @JsonKey(includeIfNull: false) this.resultat,
    @JsonKey(includeIfNull: false) this.etatConstate,
    @JsonKey(includeIfNull: false) this.siteConstate,
    @JsonKey(includeIfNull: false) this.affectataireConstate,
    @JsonKey(includeIfNull: false) this.note,
  });

  factory _$ComptageInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComptageInputImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? immobilisationId;
  @override
  @JsonKey(includeIfNull: false)
  final ResultatInventaire? resultat;
  @override
  @JsonKey(includeIfNull: false)
  final EtatBien? etatConstate;
  @override
  @JsonKey(includeIfNull: false)
  final String? siteConstate;
  @override
  @JsonKey(includeIfNull: false)
  final String? affectataireConstate;
  @override
  @JsonKey(includeIfNull: false)
  final String? note;

  @override
  String toString() {
    return 'ComptageInput(immobilisationId: $immobilisationId, resultat: $resultat, etatConstate: $etatConstate, siteConstate: $siteConstate, affectataireConstate: $affectataireConstate, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComptageInputImpl &&
            (identical(other.immobilisationId, immobilisationId) ||
                other.immobilisationId == immobilisationId) &&
            (identical(other.resultat, resultat) ||
                other.resultat == resultat) &&
            (identical(other.etatConstate, etatConstate) ||
                other.etatConstate == etatConstate) &&
            (identical(other.siteConstate, siteConstate) ||
                other.siteConstate == siteConstate) &&
            (identical(other.affectataireConstate, affectataireConstate) ||
                other.affectataireConstate == affectataireConstate) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    immobilisationId,
    resultat,
    etatConstate,
    siteConstate,
    affectataireConstate,
    note,
  );

  /// Create a copy of ComptageInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComptageInputImplCopyWith<_$ComptageInputImpl> get copyWith =>
      __$$ComptageInputImplCopyWithImpl<_$ComptageInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComptageInputImplToJson(this);
  }
}

abstract class _ComptageInput implements ComptageInput {
  const factory _ComptageInput({
    @JsonKey(includeIfNull: false) final String? immobilisationId,
    @JsonKey(includeIfNull: false) final ResultatInventaire? resultat,
    @JsonKey(includeIfNull: false) final EtatBien? etatConstate,
    @JsonKey(includeIfNull: false) final String? siteConstate,
    @JsonKey(includeIfNull: false) final String? affectataireConstate,
    @JsonKey(includeIfNull: false) final String? note,
  }) = _$ComptageInputImpl;

  factory _ComptageInput.fromJson(Map<String, dynamic> json) =
      _$ComptageInputImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get immobilisationId;
  @override
  @JsonKey(includeIfNull: false)
  ResultatInventaire? get resultat;
  @override
  @JsonKey(includeIfNull: false)
  EtatBien? get etatConstate;
  @override
  @JsonKey(includeIfNull: false)
  String? get siteConstate;
  @override
  @JsonKey(includeIfNull: false)
  String? get affectataireConstate;
  @override
  @JsonKey(includeIfNull: false)
  String? get note;

  /// Create a copy of ComptageInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComptageInputImplCopyWith<_$ComptageInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
