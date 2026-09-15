// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livraison_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LivraisonInput _$LivraisonInputFromJson(Map<String, dynamic> json) {
  return _LivraisonInput.fromJson(json);
}

/// @nodoc
mixin _$LivraisonInput {
  String get reference => throw _privateConstructorUsedError;
  int get quantiteRecue => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get commentaire => throw _privateConstructorUsedError;

  /// Serializes this LivraisonInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LivraisonInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivraisonInputCopyWith<LivraisonInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivraisonInputCopyWith<$Res> {
  factory $LivraisonInputCopyWith(
    LivraisonInput value,
    $Res Function(LivraisonInput) then,
  ) = _$LivraisonInputCopyWithImpl<$Res, LivraisonInput>;
  @useResult
  $Res call({
    String reference,
    int quantiteRecue,
    @JsonKey(includeIfNull: false) String? commentaire,
  });
}

/// @nodoc
class _$LivraisonInputCopyWithImpl<$Res, $Val extends LivraisonInput>
    implements $LivraisonInputCopyWith<$Res> {
  _$LivraisonInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivraisonInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? quantiteRecue = null,
    Object? commentaire = freezed,
  }) {
    return _then(
      _value.copyWith(
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            quantiteRecue: null == quantiteRecue
                ? _value.quantiteRecue
                : quantiteRecue // ignore: cast_nullable_to_non_nullable
                      as int,
            commentaire: freezed == commentaire
                ? _value.commentaire
                : commentaire // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LivraisonInputImplCopyWith<$Res>
    implements $LivraisonInputCopyWith<$Res> {
  factory _$$LivraisonInputImplCopyWith(
    _$LivraisonInputImpl value,
    $Res Function(_$LivraisonInputImpl) then,
  ) = __$$LivraisonInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reference,
    int quantiteRecue,
    @JsonKey(includeIfNull: false) String? commentaire,
  });
}

/// @nodoc
class __$$LivraisonInputImplCopyWithImpl<$Res>
    extends _$LivraisonInputCopyWithImpl<$Res, _$LivraisonInputImpl>
    implements _$$LivraisonInputImplCopyWith<$Res> {
  __$$LivraisonInputImplCopyWithImpl(
    _$LivraisonInputImpl _value,
    $Res Function(_$LivraisonInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LivraisonInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? quantiteRecue = null,
    Object? commentaire = freezed,
  }) {
    return _then(
      _$LivraisonInputImpl(
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        quantiteRecue: null == quantiteRecue
            ? _value.quantiteRecue
            : quantiteRecue // ignore: cast_nullable_to_non_nullable
                  as int,
        commentaire: freezed == commentaire
            ? _value.commentaire
            : commentaire // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LivraisonInputImpl implements _LivraisonInput {
  const _$LivraisonInputImpl({
    required this.reference,
    required this.quantiteRecue,
    @JsonKey(includeIfNull: false) this.commentaire,
  });

  factory _$LivraisonInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$LivraisonInputImplFromJson(json);

  @override
  final String reference;
  @override
  final int quantiteRecue;
  @override
  @JsonKey(includeIfNull: false)
  final String? commentaire;

  @override
  String toString() {
    return 'LivraisonInput(reference: $reference, quantiteRecue: $quantiteRecue, commentaire: $commentaire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivraisonInputImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.quantiteRecue, quantiteRecue) ||
                other.quantiteRecue == quantiteRecue) &&
            (identical(other.commentaire, commentaire) ||
                other.commentaire == commentaire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reference, quantiteRecue, commentaire);

  /// Create a copy of LivraisonInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivraisonInputImplCopyWith<_$LivraisonInputImpl> get copyWith =>
      __$$LivraisonInputImplCopyWithImpl<_$LivraisonInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LivraisonInputImplToJson(this);
  }
}

abstract class _LivraisonInput implements LivraisonInput {
  const factory _LivraisonInput({
    required final String reference,
    required final int quantiteRecue,
    @JsonKey(includeIfNull: false) final String? commentaire,
  }) = _$LivraisonInputImpl;

  factory _LivraisonInput.fromJson(Map<String, dynamic> json) =
      _$LivraisonInputImpl.fromJson;

  @override
  String get reference;
  @override
  int get quantiteRecue;
  @override
  @JsonKey(includeIfNull: false)
  String? get commentaire;

  /// Create a copy of LivraisonInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivraisonInputImplCopyWith<_$LivraisonInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
