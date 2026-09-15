// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get tenantSlug => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  List<String>? get roles => throw _privateConstructorUsedError;
  bool? get isEmployee => throw _privateConstructorUsedError;
  String? get tenantName => throw _privateConstructorUsedError;
  bool? get cnxlinkAccess => throw _privateConstructorUsedError;
  bool? get permissionsStale => throw _privateConstructorUsedError;
  bool? get isOwner => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    String email,
    String name,
    String tenantId,
    String tenantSlug,
    List<String> permissions,
    String? image,
    String? phone,
    String? role,
    List<String>? roles,
    bool? isEmployee,
    String? tenantName,
    bool? cnxlinkAccess,
    bool? permissionsStale,
    bool? isOwner,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? tenantId = null,
    Object? tenantSlug = null,
    Object? permissions = null,
    Object? image = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? roles = freezed,
    Object? isEmployee = freezed,
    Object? tenantName = freezed,
    Object? cnxlinkAccess = freezed,
    Object? permissionsStale = freezed,
    Object? isOwner = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            tenantId: null == tenantId
                ? _value.tenantId
                : tenantId // ignore: cast_nullable_to_non_nullable
                      as String,
            tenantSlug: null == tenantSlug
                ? _value.tenantSlug
                : tenantSlug // ignore: cast_nullable_to_non_nullable
                      as String,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            roles: freezed == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            isEmployee: freezed == isEmployee
                ? _value.isEmployee
                : isEmployee // ignore: cast_nullable_to_non_nullable
                      as bool?,
            tenantName: freezed == tenantName
                ? _value.tenantName
                : tenantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            cnxlinkAccess: freezed == cnxlinkAccess
                ? _value.cnxlinkAccess
                : cnxlinkAccess // ignore: cast_nullable_to_non_nullable
                      as bool?,
            permissionsStale: freezed == permissionsStale
                ? _value.permissionsStale
                : permissionsStale // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isOwner: freezed == isOwner
                ? _value.isOwner
                : isOwner // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String name,
    String tenantId,
    String tenantSlug,
    List<String> permissions,
    String? image,
    String? phone,
    String? role,
    List<String>? roles,
    bool? isEmployee,
    String? tenantName,
    bool? cnxlinkAccess,
    bool? permissionsStale,
    bool? isOwner,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? tenantId = null,
    Object? tenantSlug = null,
    Object? permissions = null,
    Object? image = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? roles = freezed,
    Object? isEmployee = freezed,
    Object? tenantName = freezed,
    Object? cnxlinkAccess = freezed,
    Object? permissionsStale = freezed,
    Object? isOwner = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantId: null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantSlug: null == tenantSlug
            ? _value.tenantSlug
            : tenantSlug // ignore: cast_nullable_to_non_nullable
                  as String,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        roles: freezed == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        isEmployee: freezed == isEmployee
            ? _value.isEmployee
            : isEmployee // ignore: cast_nullable_to_non_nullable
                  as bool?,
        tenantName: freezed == tenantName
            ? _value.tenantName
            : tenantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        cnxlinkAccess: freezed == cnxlinkAccess
            ? _value.cnxlinkAccess
            : cnxlinkAccess // ignore: cast_nullable_to_non_nullable
                  as bool?,
        permissionsStale: freezed == permissionsStale
            ? _value.permissionsStale
            : permissionsStale // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isOwner: freezed == isOwner
            ? _value.isOwner
            : isOwner // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    required this.email,
    required this.name,
    required this.tenantId,
    required this.tenantSlug,
    required final List<String> permissions,
    this.image,
    this.phone,
    this.role,
    final List<String>? roles,
    this.isEmployee,
    this.tenantName,
    this.cnxlinkAccess,
    this.permissionsStale,
    this.isOwner,
  }) : _permissions = permissions,
       _roles = roles;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String tenantId;
  @override
  final String tenantSlug;
  final List<String> _permissions;
  @override
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  final String? image;
  @override
  final String? phone;
  @override
  final String? role;
  final List<String>? _roles;
  @override
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isEmployee;
  @override
  final String? tenantName;
  @override
  final bool? cnxlinkAccess;
  @override
  final bool? permissionsStale;
  @override
  final bool? isOwner;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, tenantId: $tenantId, tenantSlug: $tenantSlug, permissions: $permissions, image: $image, phone: $phone, role: $role, roles: $roles, isEmployee: $isEmployee, tenantName: $tenantName, cnxlinkAccess: $cnxlinkAccess, permissionsStale: $permissionsStale, isOwner: $isOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.tenantSlug, tenantSlug) ||
                other.tenantSlug == tenantSlug) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.isEmployee, isEmployee) ||
                other.isEmployee == isEmployee) &&
            (identical(other.tenantName, tenantName) ||
                other.tenantName == tenantName) &&
            (identical(other.cnxlinkAccess, cnxlinkAccess) ||
                other.cnxlinkAccess == cnxlinkAccess) &&
            (identical(other.permissionsStale, permissionsStale) ||
                other.permissionsStale == permissionsStale) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    name,
    tenantId,
    tenantSlug,
    const DeepCollectionEquality().hash(_permissions),
    image,
    phone,
    role,
    const DeepCollectionEquality().hash(_roles),
    isEmployee,
    tenantName,
    cnxlinkAccess,
    permissionsStale,
    isOwner,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String id,
    required final String email,
    required final String name,
    required final String tenantId,
    required final String tenantSlug,
    required final List<String> permissions,
    final String? image,
    final String? phone,
    final String? role,
    final List<String>? roles,
    final bool? isEmployee,
    final String? tenantName,
    final bool? cnxlinkAccess,
    final bool? permissionsStale,
    final bool? isOwner,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String get tenantId;
  @override
  String get tenantSlug;
  @override
  List<String> get permissions;
  @override
  String? get image;
  @override
  String? get phone;
  @override
  String? get role;
  @override
  List<String>? get roles;
  @override
  bool? get isEmployee;
  @override
  String? get tenantName;
  @override
  bool? get cnxlinkAccess;
  @override
  bool? get permissionsStale;
  @override
  bool? get isOwner;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
