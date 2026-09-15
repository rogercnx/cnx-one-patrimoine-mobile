// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comptage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ComptageModification _$ComptageModificationFromJson(Map<String, dynamic> json) {
  return _ComptageModification.fromJson(json);
}

/// @nodoc
mixin _$ComptageModification {
  EtatBien? get etat => throw _privateConstructorUsedError;
  String? get siteId => throw _privateConstructorUsedError;
  String? get local => throw _privateConstructorUsedError;
  String? get affectataire => throw _privateConstructorUsedError;

  /// Serializes this ComptageModification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComptageModification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComptageModificationCopyWith<ComptageModification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComptageModificationCopyWith<$Res> {
  factory $ComptageModificationCopyWith(
    ComptageModification value,
    $Res Function(ComptageModification) then,
  ) = _$ComptageModificationCopyWithImpl<$Res, ComptageModification>;
  @useResult
  $Res call({
    EtatBien? etat,
    String? siteId,
    String? local,
    String? affectataire,
  });
}

/// @nodoc
class _$ComptageModificationCopyWithImpl<
  $Res,
  $Val extends ComptageModification
>
    implements $ComptageModificationCopyWith<$Res> {
  _$ComptageModificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComptageModification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? etat = freezed,
    Object? siteId = freezed,
    Object? local = freezed,
    Object? affectataire = freezed,
  }) {
    return _then(
      _value.copyWith(
            etat: freezed == etat
                ? _value.etat
                : etat // ignore: cast_nullable_to_non_nullable
                      as EtatBien?,
            siteId: freezed == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            local: freezed == local
                ? _value.local
                : local // ignore: cast_nullable_to_non_nullable
                      as String?,
            affectataire: freezed == affectataire
                ? _value.affectataire
                : affectataire // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ComptageModificationImplCopyWith<$Res>
    implements $ComptageModificationCopyWith<$Res> {
  factory _$$ComptageModificationImplCopyWith(
    _$ComptageModificationImpl value,
    $Res Function(_$ComptageModificationImpl) then,
  ) = __$$ComptageModificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EtatBien? etat,
    String? siteId,
    String? local,
    String? affectataire,
  });
}

/// @nodoc
class __$$ComptageModificationImplCopyWithImpl<$Res>
    extends _$ComptageModificationCopyWithImpl<$Res, _$ComptageModificationImpl>
    implements _$$ComptageModificationImplCopyWith<$Res> {
  __$$ComptageModificationImplCopyWithImpl(
    _$ComptageModificationImpl _value,
    $Res Function(_$ComptageModificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComptageModification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? etat = freezed,
    Object? siteId = freezed,
    Object? local = freezed,
    Object? affectataire = freezed,
  }) {
    return _then(
      _$ComptageModificationImpl(
        etat: freezed == etat
            ? _value.etat
            : etat // ignore: cast_nullable_to_non_nullable
                  as EtatBien?,
        siteId: freezed == siteId
            ? _value.siteId
            : siteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        local: freezed == local
            ? _value.local
            : local // ignore: cast_nullable_to_non_nullable
                  as String?,
        affectataire: freezed == affectataire
            ? _value.affectataire
            : affectataire // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ComptageModificationImpl implements _ComptageModification {
  const _$ComptageModificationImpl({
    this.etat,
    this.siteId,
    this.local,
    this.affectataire,
  });

  factory _$ComptageModificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComptageModificationImplFromJson(json);

  @override
  final EtatBien? etat;
  @override
  final String? siteId;
  @override
  final String? local;
  @override
  final String? affectataire;

  @override
  String toString() {
    return 'ComptageModification(etat: $etat, siteId: $siteId, local: $local, affectataire: $affectataire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComptageModificationImpl &&
            (identical(other.etat, etat) || other.etat == etat) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.affectataire, affectataire) ||
                other.affectataire == affectataire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, etat, siteId, local, affectataire);

  /// Create a copy of ComptageModification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComptageModificationImplCopyWith<_$ComptageModificationImpl>
  get copyWith =>
      __$$ComptageModificationImplCopyWithImpl<_$ComptageModificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ComptageModificationImplToJson(this);
  }
}

abstract class _ComptageModification implements ComptageModification {
  const factory _ComptageModification({
    final EtatBien? etat,
    final String? siteId,
    final String? local,
    final String? affectataire,
  }) = _$ComptageModificationImpl;

  factory _ComptageModification.fromJson(Map<String, dynamic> json) =
      _$ComptageModificationImpl.fromJson;

  @override
  EtatBien? get etat;
  @override
  String? get siteId;
  @override
  String? get local;
  @override
  String? get affectataire;

  /// Create a copy of ComptageModification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComptageModificationImplCopyWith<_$ComptageModificationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ComptageModel _$ComptageModelFromJson(Map<String, dynamic> json) {
  return _ComptageModel.fromJson(json);
}

/// @nodoc
mixin _$ComptageModel {
  String get immobilisationId => throw _privateConstructorUsedError;
  ResultatComptage get resultat => throw _privateConstructorUsedError;
  DateTime get dateHeure => throw _privateConstructorUsedError;
  String get agentNom => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  ComptageModification? get modification => throw _privateConstructorUsedError;

  /// Serializes this ComptageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComptageModelCopyWith<ComptageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComptageModelCopyWith<$Res> {
  factory $ComptageModelCopyWith(
    ComptageModel value,
    $Res Function(ComptageModel) then,
  ) = _$ComptageModelCopyWithImpl<$Res, ComptageModel>;
  @useResult
  $Res call({
    String immobilisationId,
    ResultatComptage resultat,
    DateTime dateHeure,
    String agentNom,
    String? note,
    ComptageModification? modification,
  });

  $ComptageModificationCopyWith<$Res>? get modification;
}

/// @nodoc
class _$ComptageModelCopyWithImpl<$Res, $Val extends ComptageModel>
    implements $ComptageModelCopyWith<$Res> {
  _$ComptageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immobilisationId = null,
    Object? resultat = null,
    Object? dateHeure = null,
    Object? agentNom = null,
    Object? note = freezed,
    Object? modification = freezed,
  }) {
    return _then(
      _value.copyWith(
            immobilisationId: null == immobilisationId
                ? _value.immobilisationId
                : immobilisationId // ignore: cast_nullable_to_non_nullable
                      as String,
            resultat: null == resultat
                ? _value.resultat
                : resultat // ignore: cast_nullable_to_non_nullable
                      as ResultatComptage,
            dateHeure: null == dateHeure
                ? _value.dateHeure
                : dateHeure // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            agentNom: null == agentNom
                ? _value.agentNom
                : agentNom // ignore: cast_nullable_to_non_nullable
                      as String,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            modification: freezed == modification
                ? _value.modification
                : modification // ignore: cast_nullable_to_non_nullable
                      as ComptageModification?,
          )
          as $Val,
    );
  }

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComptageModificationCopyWith<$Res>? get modification {
    if (_value.modification == null) {
      return null;
    }

    return $ComptageModificationCopyWith<$Res>(_value.modification!, (value) {
      return _then(_value.copyWith(modification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComptageModelImplCopyWith<$Res>
    implements $ComptageModelCopyWith<$Res> {
  factory _$$ComptageModelImplCopyWith(
    _$ComptageModelImpl value,
    $Res Function(_$ComptageModelImpl) then,
  ) = __$$ComptageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String immobilisationId,
    ResultatComptage resultat,
    DateTime dateHeure,
    String agentNom,
    String? note,
    ComptageModification? modification,
  });

  @override
  $ComptageModificationCopyWith<$Res>? get modification;
}

/// @nodoc
class __$$ComptageModelImplCopyWithImpl<$Res>
    extends _$ComptageModelCopyWithImpl<$Res, _$ComptageModelImpl>
    implements _$$ComptageModelImplCopyWith<$Res> {
  __$$ComptageModelImplCopyWithImpl(
    _$ComptageModelImpl _value,
    $Res Function(_$ComptageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immobilisationId = null,
    Object? resultat = null,
    Object? dateHeure = null,
    Object? agentNom = null,
    Object? note = freezed,
    Object? modification = freezed,
  }) {
    return _then(
      _$ComptageModelImpl(
        immobilisationId: null == immobilisationId
            ? _value.immobilisationId
            : immobilisationId // ignore: cast_nullable_to_non_nullable
                  as String,
        resultat: null == resultat
            ? _value.resultat
            : resultat // ignore: cast_nullable_to_non_nullable
                  as ResultatComptage,
        dateHeure: null == dateHeure
            ? _value.dateHeure
            : dateHeure // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        agentNom: null == agentNom
            ? _value.agentNom
            : agentNom // ignore: cast_nullable_to_non_nullable
                  as String,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        modification: freezed == modification
            ? _value.modification
            : modification // ignore: cast_nullable_to_non_nullable
                  as ComptageModification?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ComptageModelImpl implements _ComptageModel {
  const _$ComptageModelImpl({
    required this.immobilisationId,
    required this.resultat,
    required this.dateHeure,
    required this.agentNom,
    this.note,
    this.modification,
  });

  factory _$ComptageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComptageModelImplFromJson(json);

  @override
  final String immobilisationId;
  @override
  final ResultatComptage resultat;
  @override
  final DateTime dateHeure;
  @override
  final String agentNom;
  @override
  final String? note;
  @override
  final ComptageModification? modification;

  @override
  String toString() {
    return 'ComptageModel(immobilisationId: $immobilisationId, resultat: $resultat, dateHeure: $dateHeure, agentNom: $agentNom, note: $note, modification: $modification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComptageModelImpl &&
            (identical(other.immobilisationId, immobilisationId) ||
                other.immobilisationId == immobilisationId) &&
            (identical(other.resultat, resultat) ||
                other.resultat == resultat) &&
            (identical(other.dateHeure, dateHeure) ||
                other.dateHeure == dateHeure) &&
            (identical(other.agentNom, agentNom) ||
                other.agentNom == agentNom) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.modification, modification) ||
                other.modification == modification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    immobilisationId,
    resultat,
    dateHeure,
    agentNom,
    note,
    modification,
  );

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComptageModelImplCopyWith<_$ComptageModelImpl> get copyWith =>
      __$$ComptageModelImplCopyWithImpl<_$ComptageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComptageModelImplToJson(this);
  }
}

abstract class _ComptageModel implements ComptageModel {
  const factory _ComptageModel({
    required final String immobilisationId,
    required final ResultatComptage resultat,
    required final DateTime dateHeure,
    required final String agentNom,
    final String? note,
    final ComptageModification? modification,
  }) = _$ComptageModelImpl;

  factory _ComptageModel.fromJson(Map<String, dynamic> json) =
      _$ComptageModelImpl.fromJson;

  @override
  String get immobilisationId;
  @override
  ResultatComptage get resultat;
  @override
  DateTime get dateHeure;
  @override
  String get agentNom;
  @override
  String? get note;
  @override
  ComptageModification? get modification;

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComptageModelImplCopyWith<_$ComptageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
