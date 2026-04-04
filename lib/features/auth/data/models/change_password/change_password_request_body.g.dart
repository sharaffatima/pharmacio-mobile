// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestBody _$ChangePasswordRequestBodyFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequestBody(
  oldPassword: json['old_password'] as String,
  newPassword: json['new_password'] as String,
  confirmPassword: json['confirme_password'] as String,
);

Map<String, dynamic> _$ChangePasswordRequestBodyToJson(
  ChangePasswordRequestBody instance,
) => <String, dynamic>{
  'old_password': instance.oldPassword,
  'new_password': instance.newPassword,
  'confirme_password': instance.confirmPassword,
};
