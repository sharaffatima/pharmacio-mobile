// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponse _$ChangePasswordResponseFromJson(
  Map<String, dynamic> json,
) => ChangePasswordResponse(
  message: json['message'] as String,
  tokens: Token.fromJson(json['tokens'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChangePasswordResponseToJson(
  ChangePasswordResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'tokens': instance.tokens.toJson(),
};
