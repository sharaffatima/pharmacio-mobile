// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'message': instance.message,
    };

Token _$TokenFromJson(Map<String, dynamic> json) =>
    Token(refresh: json['refresh'] as String, access: json['access'] as String);

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
  'refresh': instance.refresh,
  'access': instance.access,
};
