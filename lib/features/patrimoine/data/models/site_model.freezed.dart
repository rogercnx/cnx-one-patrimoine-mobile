// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SiteModel _$SiteModelFromJson(Map<String, dynamic> json) {
  return _SiteModel.fromJson(json);
}

/// @nodoc
mixin _$SiteModel {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get ville => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this SiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteModelCopyWith<SiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteModelCopyWith<$Res> {
  factory $SiteModelCopyWith(SiteModel value, $Res Function(SiteModel) then) =
      _$SiteModelCopyWithImpl<$Res, SiteModel>;
  @useResult
  $Res call({
    String id,
    String code,
    String nom,
    String ville,
    double latitude,
    double longitude,
  });
}

/// @nodoc
class _$SiteModelCopyWithImpl<$Res, $Val extends SiteModel>
    implements $SiteModelCopyWith<$Res> {
  _$SiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? nom = null,
    Object? ville = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            ville: null == ville
                ? _value.ville
                : ville // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteModelImplCopyWith<$Res>
    implements $SiteModelCopyWith<$Res> {
  factory _$$SiteModelImplCopyWith(
    _$SiteModelImpl value,
    $Res Function(_$SiteModelImpl) then,
  ) = __$$SiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String nom,
    String ville,
    double latitude,
    double longitude,
  });
}

/// @nodoc
class __$$SiteModelImplCopyWithImpl<$Res>
    extends _$SiteModelCopyWithImpl<$Res, _$SiteModelImpl>
    implements _$$SiteModelImplCopyWith<$Res> {
  __$$SiteModelImplCopyWithImpl(
    _$SiteModelImpl _value,
    $Res Function(_$SiteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? nom = null,
    Object? ville = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(
      _$SiteModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        ville: null == ville
            ? _value.ville
            : ville // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteModelImpl implements _SiteModel {
  const _$SiteModelImpl({
    required this.id,
    required this.code,
    required this.nom,
    required this.ville,
    required this.latitude,
    required this.longitude,
  });

  factory _$SiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteModelImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String nom;
  @override
  final String ville;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'SiteModel(id: $id, code: $code, nom: $nom, ville: $ville, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, nom, ville, latitude, longitude);

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteModelImplCopyWith<_$SiteModelImpl> get copyWith =>
      __$$SiteModelImplCopyWithImpl<_$SiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteModelImplToJson(this);
  }
}

abstract class _SiteModel implements SiteModel {
  const factory _SiteModel({
    required final String id,
    required final String code,
    required final String nom,
    required final String ville,
    required final double latitude,
    required final double longitude,
  }) = _$SiteModelImpl;

  factory _SiteModel.fromJson(Map<String, dynamic> json) =
      _$SiteModelImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get nom;
  @override
  String get ville;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of SiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteModelImplCopyWith<_$SiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
