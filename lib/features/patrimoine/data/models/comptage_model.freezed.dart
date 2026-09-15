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

ComptageModel _$ComptageModelFromJson(Map<String, dynamic> json) {
  return _ComptageModel.fromJson(json);
}

/// @nodoc
mixin _$ComptageModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'campagne_id')
  String get campagneId => throw _privateConstructorUsedError;
  @JsonKey(name: 'immobilisation_id')
  String get immobilisationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_id')
  String get agentId => throw _privateConstructorUsedError;
  ResultatInventaire get resultat => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_heure')
  DateTime get dateHeure => throw _privateConstructorUsedError;
  @JsonKey(name: 'etat_constate')
  EtatBien? get etatConstate => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_constate')
  String? get siteConstate => throw _privateConstructorUsedError;
  @JsonKey(name: 'affectataire_constate')
  String? get affectataireConstate => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'zone_id')
  String? get zoneId => throw _privateConstructorUsedError;
  @JsonKey(name: 'maj_corrections')
  dynamic get majCorrections => throw _privateConstructorUsedError;

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
    String id,
    @JsonKey(name: 'campagne_id') String campagneId,
    @JsonKey(name: 'immobilisation_id') String immobilisationId,
    @JsonKey(name: 'agent_id') String agentId,
    ResultatInventaire resultat,
    @JsonKey(name: 'date_heure') DateTime dateHeure,
    @JsonKey(name: 'etat_constate') EtatBien? etatConstate,
    @JsonKey(name: 'site_constate') String? siteConstate,
    @JsonKey(name: 'affectataire_constate') String? affectataireConstate,
    String? note,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'zone_id') String? zoneId,
    @JsonKey(name: 'maj_corrections') dynamic majCorrections,
  });
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
    Object? id = null,
    Object? campagneId = null,
    Object? immobilisationId = null,
    Object? agentId = null,
    Object? resultat = null,
    Object? dateHeure = null,
    Object? etatConstate = freezed,
    Object? siteConstate = freezed,
    Object? affectataireConstate = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? zoneId = freezed,
    Object? majCorrections = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            campagneId: null == campagneId
                ? _value.campagneId
                : campagneId // ignore: cast_nullable_to_non_nullable
                      as String,
            immobilisationId: null == immobilisationId
                ? _value.immobilisationId
                : immobilisationId // ignore: cast_nullable_to_non_nullable
                      as String,
            agentId: null == agentId
                ? _value.agentId
                : agentId // ignore: cast_nullable_to_non_nullable
                      as String,
            resultat: null == resultat
                ? _value.resultat
                : resultat // ignore: cast_nullable_to_non_nullable
                      as ResultatInventaire,
            dateHeure: null == dateHeure
                ? _value.dateHeure
                : dateHeure // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            zoneId: freezed == zoneId
                ? _value.zoneId
                : zoneId // ignore: cast_nullable_to_non_nullable
                      as String?,
            majCorrections: freezed == majCorrections
                ? _value.majCorrections
                : majCorrections // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
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
    String id,
    @JsonKey(name: 'campagne_id') String campagneId,
    @JsonKey(name: 'immobilisation_id') String immobilisationId,
    @JsonKey(name: 'agent_id') String agentId,
    ResultatInventaire resultat,
    @JsonKey(name: 'date_heure') DateTime dateHeure,
    @JsonKey(name: 'etat_constate') EtatBien? etatConstate,
    @JsonKey(name: 'site_constate') String? siteConstate,
    @JsonKey(name: 'affectataire_constate') String? affectataireConstate,
    String? note,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'zone_id') String? zoneId,
    @JsonKey(name: 'maj_corrections') dynamic majCorrections,
  });
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
    Object? id = null,
    Object? campagneId = null,
    Object? immobilisationId = null,
    Object? agentId = null,
    Object? resultat = null,
    Object? dateHeure = null,
    Object? etatConstate = freezed,
    Object? siteConstate = freezed,
    Object? affectataireConstate = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? zoneId = freezed,
    Object? majCorrections = freezed,
  }) {
    return _then(
      _$ComptageModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        campagneId: null == campagneId
            ? _value.campagneId
            : campagneId // ignore: cast_nullable_to_non_nullable
                  as String,
        immobilisationId: null == immobilisationId
            ? _value.immobilisationId
            : immobilisationId // ignore: cast_nullable_to_non_nullable
                  as String,
        agentId: null == agentId
            ? _value.agentId
            : agentId // ignore: cast_nullable_to_non_nullable
                  as String,
        resultat: null == resultat
            ? _value.resultat
            : resultat // ignore: cast_nullable_to_non_nullable
                  as ResultatInventaire,
        dateHeure: null == dateHeure
            ? _value.dateHeure
            : dateHeure // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        zoneId: freezed == zoneId
            ? _value.zoneId
            : zoneId // ignore: cast_nullable_to_non_nullable
                  as String?,
        majCorrections: freezed == majCorrections
            ? _value.majCorrections
            : majCorrections // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ComptageModelImpl implements _ComptageModel {
  const _$ComptageModelImpl({
    required this.id,
    @JsonKey(name: 'campagne_id') required this.campagneId,
    @JsonKey(name: 'immobilisation_id') required this.immobilisationId,
    @JsonKey(name: 'agent_id') required this.agentId,
    required this.resultat,
    @JsonKey(name: 'date_heure') required this.dateHeure,
    @JsonKey(name: 'etat_constate') this.etatConstate,
    @JsonKey(name: 'site_constate') this.siteConstate,
    @JsonKey(name: 'affectataire_constate') this.affectataireConstate,
    this.note,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'zone_id') this.zoneId,
    @JsonKey(name: 'maj_corrections') this.majCorrections,
  });

  factory _$ComptageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComptageModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'campagne_id')
  final String campagneId;
  @override
  @JsonKey(name: 'immobilisation_id')
  final String immobilisationId;
  @override
  @JsonKey(name: 'agent_id')
  final String agentId;
  @override
  final ResultatInventaire resultat;
  @override
  @JsonKey(name: 'date_heure')
  final DateTime dateHeure;
  @override
  @JsonKey(name: 'etat_constate')
  final EtatBien? etatConstate;
  @override
  @JsonKey(name: 'site_constate')
  final String? siteConstate;
  @override
  @JsonKey(name: 'affectataire_constate')
  final String? affectataireConstate;
  @override
  final String? note;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'zone_id')
  final String? zoneId;
  @override
  @JsonKey(name: 'maj_corrections')
  final dynamic majCorrections;

  @override
  String toString() {
    return 'ComptageModel(id: $id, campagneId: $campagneId, immobilisationId: $immobilisationId, agentId: $agentId, resultat: $resultat, dateHeure: $dateHeure, etatConstate: $etatConstate, siteConstate: $siteConstate, affectataireConstate: $affectataireConstate, note: $note, createdAt: $createdAt, updatedAt: $updatedAt, zoneId: $zoneId, majCorrections: $majCorrections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComptageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.campagneId, campagneId) ||
                other.campagneId == campagneId) &&
            (identical(other.immobilisationId, immobilisationId) ||
                other.immobilisationId == immobilisationId) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.resultat, resultat) ||
                other.resultat == resultat) &&
            (identical(other.dateHeure, dateHeure) ||
                other.dateHeure == dateHeure) &&
            (identical(other.etatConstate, etatConstate) ||
                other.etatConstate == etatConstate) &&
            (identical(other.siteConstate, siteConstate) ||
                other.siteConstate == siteConstate) &&
            (identical(other.affectataireConstate, affectataireConstate) ||
                other.affectataireConstate == affectataireConstate) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            const DeepCollectionEquality().equals(
              other.majCorrections,
              majCorrections,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    campagneId,
    immobilisationId,
    agentId,
    resultat,
    dateHeure,
    etatConstate,
    siteConstate,
    affectataireConstate,
    note,
    createdAt,
    updatedAt,
    zoneId,
    const DeepCollectionEquality().hash(majCorrections),
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
    required final String id,
    @JsonKey(name: 'campagne_id') required final String campagneId,
    @JsonKey(name: 'immobilisation_id') required final String immobilisationId,
    @JsonKey(name: 'agent_id') required final String agentId,
    required final ResultatInventaire resultat,
    @JsonKey(name: 'date_heure') required final DateTime dateHeure,
    @JsonKey(name: 'etat_constate') final EtatBien? etatConstate,
    @JsonKey(name: 'site_constate') final String? siteConstate,
    @JsonKey(name: 'affectataire_constate') final String? affectataireConstate,
    final String? note,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'zone_id') final String? zoneId,
    @JsonKey(name: 'maj_corrections') final dynamic majCorrections,
  }) = _$ComptageModelImpl;

  factory _ComptageModel.fromJson(Map<String, dynamic> json) =
      _$ComptageModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'campagne_id')
  String get campagneId;
  @override
  @JsonKey(name: 'immobilisation_id')
  String get immobilisationId;
  @override
  @JsonKey(name: 'agent_id')
  String get agentId;
  @override
  ResultatInventaire get resultat;
  @override
  @JsonKey(name: 'date_heure')
  DateTime get dateHeure;
  @override
  @JsonKey(name: 'etat_constate')
  EtatBien? get etatConstate;
  @override
  @JsonKey(name: 'site_constate')
  String? get siteConstate;
  @override
  @JsonKey(name: 'affectataire_constate')
  String? get affectataireConstate;
  @override
  String? get note;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'zone_id')
  String? get zoneId;
  @override
  @JsonKey(name: 'maj_corrections')
  dynamic get majCorrections;

  /// Create a copy of ComptageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComptageModelImplCopyWith<_$ComptageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
