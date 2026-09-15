// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campagne_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CampagneModel _$CampagneModelFromJson(Map<String, dynamic> json) {
  return _CampagneModel.fromJson(json);
}

/// @nodoc
mixin _$CampagneModel {
  String get id => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get libelle => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_debut')
  DateTime get dateDebut => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_fin')
  DateTime? get dateFin => throw _privateConstructorUsedError;
  String? get perimetre => throw _privateConstructorUsedError;
  StatutCampagne get statut => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get gel => throw _privateConstructorUsedError;
  @JsonKey(name: 'perimetre_site_id')
  String? get perimetreSiteId => throw _privateConstructorUsedError;
  String? get responsable => throw _privateConstructorUsedError;

  /// Serializes this CampagneModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CampagneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CampagneModelCopyWith<CampagneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampagneModelCopyWith<$Res> {
  factory $CampagneModelCopyWith(
    CampagneModel value,
    $Res Function(CampagneModel) then,
  ) = _$CampagneModelCopyWithImpl<$Res, CampagneModel>;
  @useResult
  $Res call({
    String id,
    String reference,
    String libelle,
    @JsonKey(name: 'date_debut') DateTime dateDebut,
    @JsonKey(name: 'date_fin') DateTime? dateFin,
    String? perimetre,
    StatutCampagne statut,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    bool gel,
    @JsonKey(name: 'perimetre_site_id') String? perimetreSiteId,
    String? responsable,
  });
}

/// @nodoc
class _$CampagneModelCopyWithImpl<$Res, $Val extends CampagneModel>
    implements $CampagneModelCopyWith<$Res> {
  _$CampagneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CampagneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? libelle = null,
    Object? dateDebut = null,
    Object? dateFin = freezed,
    Object? perimetre = freezed,
    Object? statut = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? gel = null,
    Object? perimetreSiteId = freezed,
    Object? responsable = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            libelle: null == libelle
                ? _value.libelle
                : libelle // ignore: cast_nullable_to_non_nullable
                      as String,
            dateDebut: null == dateDebut
                ? _value.dateDebut
                : dateDebut // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dateFin: freezed == dateFin
                ? _value.dateFin
                : dateFin // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            perimetre: freezed == perimetre
                ? _value.perimetre
                : perimetre // ignore: cast_nullable_to_non_nullable
                      as String?,
            statut: null == statut
                ? _value.statut
                : statut // ignore: cast_nullable_to_non_nullable
                      as StatutCampagne,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            gel: null == gel
                ? _value.gel
                : gel // ignore: cast_nullable_to_non_nullable
                      as bool,
            perimetreSiteId: freezed == perimetreSiteId
                ? _value.perimetreSiteId
                : perimetreSiteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            responsable: freezed == responsable
                ? _value.responsable
                : responsable // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CampagneModelImplCopyWith<$Res>
    implements $CampagneModelCopyWith<$Res> {
  factory _$$CampagneModelImplCopyWith(
    _$CampagneModelImpl value,
    $Res Function(_$CampagneModelImpl) then,
  ) = __$$CampagneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String reference,
    String libelle,
    @JsonKey(name: 'date_debut') DateTime dateDebut,
    @JsonKey(name: 'date_fin') DateTime? dateFin,
    String? perimetre,
    StatutCampagne statut,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    bool gel,
    @JsonKey(name: 'perimetre_site_id') String? perimetreSiteId,
    String? responsable,
  });
}

/// @nodoc
class __$$CampagneModelImplCopyWithImpl<$Res>
    extends _$CampagneModelCopyWithImpl<$Res, _$CampagneModelImpl>
    implements _$$CampagneModelImplCopyWith<$Res> {
  __$$CampagneModelImplCopyWithImpl(
    _$CampagneModelImpl _value,
    $Res Function(_$CampagneModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CampagneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? libelle = null,
    Object? dateDebut = null,
    Object? dateFin = freezed,
    Object? perimetre = freezed,
    Object? statut = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? gel = null,
    Object? perimetreSiteId = freezed,
    Object? responsable = freezed,
  }) {
    return _then(
      _$CampagneModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        libelle: null == libelle
            ? _value.libelle
            : libelle // ignore: cast_nullable_to_non_nullable
                  as String,
        dateDebut: null == dateDebut
            ? _value.dateDebut
            : dateDebut // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dateFin: freezed == dateFin
            ? _value.dateFin
            : dateFin // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        perimetre: freezed == perimetre
            ? _value.perimetre
            : perimetre // ignore: cast_nullable_to_non_nullable
                  as String?,
        statut: null == statut
            ? _value.statut
            : statut // ignore: cast_nullable_to_non_nullable
                  as StatutCampagne,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        gel: null == gel
            ? _value.gel
            : gel // ignore: cast_nullable_to_non_nullable
                  as bool,
        perimetreSiteId: freezed == perimetreSiteId
            ? _value.perimetreSiteId
            : perimetreSiteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        responsable: freezed == responsable
            ? _value.responsable
            : responsable // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CampagneModelImpl extends _CampagneModel {
  const _$CampagneModelImpl({
    required this.id,
    required this.reference,
    required this.libelle,
    @JsonKey(name: 'date_debut') required this.dateDebut,
    @JsonKey(name: 'date_fin') this.dateFin,
    this.perimetre,
    required this.statut,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.gel = false,
    @JsonKey(name: 'perimetre_site_id') this.perimetreSiteId,
    this.responsable,
  }) : super._();

  factory _$CampagneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CampagneModelImplFromJson(json);

  @override
  final String id;
  @override
  final String reference;
  @override
  final String libelle;
  @override
  @JsonKey(name: 'date_debut')
  final DateTime dateDebut;
  @override
  @JsonKey(name: 'date_fin')
  final DateTime? dateFin;
  @override
  final String? perimetre;
  @override
  final StatutCampagne statut;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool gel;
  @override
  @JsonKey(name: 'perimetre_site_id')
  final String? perimetreSiteId;
  @override
  final String? responsable;

  @override
  String toString() {
    return 'CampagneModel(id: $id, reference: $reference, libelle: $libelle, dateDebut: $dateDebut, dateFin: $dateFin, perimetre: $perimetre, statut: $statut, createdAt: $createdAt, updatedAt: $updatedAt, gel: $gel, perimetreSiteId: $perimetreSiteId, responsable: $responsable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampagneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.libelle, libelle) || other.libelle == libelle) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.perimetre, perimetre) ||
                other.perimetre == perimetre) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.gel, gel) || other.gel == gel) &&
            (identical(other.perimetreSiteId, perimetreSiteId) ||
                other.perimetreSiteId == perimetreSiteId) &&
            (identical(other.responsable, responsable) ||
                other.responsable == responsable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    reference,
    libelle,
    dateDebut,
    dateFin,
    perimetre,
    statut,
    createdAt,
    updatedAt,
    gel,
    perimetreSiteId,
    responsable,
  );

  /// Create a copy of CampagneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CampagneModelImplCopyWith<_$CampagneModelImpl> get copyWith =>
      __$$CampagneModelImplCopyWithImpl<_$CampagneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CampagneModelImplToJson(this);
  }
}

abstract class _CampagneModel extends CampagneModel {
  const factory _CampagneModel({
    required final String id,
    required final String reference,
    required final String libelle,
    @JsonKey(name: 'date_debut') required final DateTime dateDebut,
    @JsonKey(name: 'date_fin') final DateTime? dateFin,
    final String? perimetre,
    required final StatutCampagne statut,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final bool gel,
    @JsonKey(name: 'perimetre_site_id') final String? perimetreSiteId,
    final String? responsable,
  }) = _$CampagneModelImpl;
  const _CampagneModel._() : super._();

  factory _CampagneModel.fromJson(Map<String, dynamic> json) =
      _$CampagneModelImpl.fromJson;

  @override
  String get id;
  @override
  String get reference;
  @override
  String get libelle;
  @override
  @JsonKey(name: 'date_debut')
  DateTime get dateDebut;
  @override
  @JsonKey(name: 'date_fin')
  DateTime? get dateFin;
  @override
  String? get perimetre;
  @override
  StatutCampagne get statut;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  bool get gel;
  @override
  @JsonKey(name: 'perimetre_site_id')
  String? get perimetreSiteId;
  @override
  String? get responsable;

  /// Create a copy of CampagneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CampagneModelImplCopyWith<_$CampagneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
