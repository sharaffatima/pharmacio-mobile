// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'roles': instance.roles,
      'permissions': instance.permissions,
      'token': instance.token.toJson(),
      'message': instance.message,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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

Token _$TokenFromJson(Map<String, dynamic> json) =>
    Token(refresh: json['refresh'] as String, access: json['access'] as String);

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
  'refresh': instance.refresh,
  'access': instance.access,
};
