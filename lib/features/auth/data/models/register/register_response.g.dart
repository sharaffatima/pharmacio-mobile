// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'token': instance.token.toJson(),
      'message': instance.message,
    };
