// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AgentModel _$AgentModelFromJson(Map<String, dynamic> json) {
  return _AgentModel.fromJson(json);
}

/// @nodoc
mixin _$AgentModel {
  String get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get initiales => throw _privateConstructorUsedError;

  /// Serializes this AgentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentModelCopyWith<AgentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentModelCopyWith<$Res> {
  factory $AgentModelCopyWith(
    AgentModel value,
    $Res Function(AgentModel) then,
  ) = _$AgentModelCopyWithImpl<$Res, AgentModel>;
  @useResult
  $Res call({String id, String nom, String role, String initiales});
}

/// @nodoc
class _$AgentModelCopyWithImpl<$Res, $Val extends AgentModel>
    implements $AgentModelCopyWith<$Res> {
  _$AgentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? role = null,
    Object? initiales = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            initiales: null == initiales
                ? _value.initiales
                : initiales // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgentModelImplCopyWith<$Res>
    implements $AgentModelCopyWith<$Res> {
  factory _$$AgentModelImplCopyWith(
    _$AgentModelImpl value,
    $Res Function(_$AgentModelImpl) then,
  ) = __$$AgentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nom, String role, String initiales});
}

/// @nodoc
class __$$AgentModelImplCopyWithImpl<$Res>
    extends _$AgentModelCopyWithImpl<$Res, _$AgentModelImpl>
    implements _$$AgentModelImplCopyWith<$Res> {
  __$$AgentModelImplCopyWithImpl(
    _$AgentModelImpl _value,
    $Res Function(_$AgentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? role = null,
    Object? initiales = null,
  }) {
    return _then(
      _$AgentModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        initiales: null == initiales
            ? _value.initiales
            : initiales // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentModelImpl implements _AgentModel {
  const _$AgentModelImpl({
    required this.id,
    required this.nom,
    required this.role,
    required this.initiales,
  });

  factory _$AgentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nom;
  @override
  final String role;
  @override
  final String initiales;

  @override
  String toString() {
    return 'AgentModel(id: $id, nom: $nom, role: $role, initiales: $initiales)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.initiales, initiales) ||
                other.initiales == initiales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, role, initiales);

  /// Create a copy of AgentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentModelImplCopyWith<_$AgentModelImpl> get copyWith =>
      __$$AgentModelImplCopyWithImpl<_$AgentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentModelImplToJson(this);
  }
}

abstract class _AgentModel implements AgentModel {
  const factory _AgentModel({
    required final String id,
    required final String nom,
    required final String role,
    required final String initiales,
  }) = _$AgentModelImpl;

  factory _AgentModel.fromJson(Map<String, dynamic> json) =
      _$AgentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nom;
  @override
  String get role;
  @override
  String get initiales;

  /// Create a copy of AgentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentModelImplCopyWith<_$AgentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
