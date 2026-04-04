// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeResponse _$MeResponseFromJson(Map<String, dynamic> json) => MeResponse(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
  phoneNumber: json['phone_number'] as String?,
  isActive: json['is_active'] as bool,
  dateJoined: DateTime.parse(json['date_joined'] as String),
);

Map<String, dynamic> _$MeResponseToJson(MeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'roles': instance.roles,
      'phone_number': instance.phoneNumber,
      'is_active': instance.isActive,
      'date_joined': instance.dateJoined.toIso8601String(),
    };
