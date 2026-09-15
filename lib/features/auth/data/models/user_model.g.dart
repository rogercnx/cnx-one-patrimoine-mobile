// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      tenantId: json['tenantId'] as String,
      tenantSlug: json['tenantSlug'] as String,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isEmployee: json['isEmployee'] as bool?,
      tenantName: json['tenantName'] as String?,
      cnxlinkAccess: json['cnxlinkAccess'] as bool?,
      permissionsStale: json['permissionsStale'] as bool?,
      isOwner: json['isOwner'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'tenantId': instance.tenantId,
      'tenantSlug': instance.tenantSlug,
      'permissions': instance.permissions,
      'image': instance.image,
      'phone': instance.phone,
      'role': instance.role,
      'roles': instance.roles,
      'isEmployee': instance.isEmployee,
      'tenantName': instance.tenantName,
      'cnxlinkAccess': instance.cnxlinkAccess,
      'permissionsStale': instance.permissionsStale,
      'isOwner': instance.isOwner,
    };
