// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      username: json['username'] as String,
      password: json['password'] as String,
      confirmPassword: json['password2'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
  'password2': instance.confirmPassword,
};
