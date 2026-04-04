import 'package:json_annotation/json_annotation.dart';

import '../login/login_response.dart';

part 'change_password_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangePasswordResponse {
  final String message;

  @JsonKey(name: 'tokens')
  final Token tokens;

  ChangePasswordResponse({
    required this.message,
    required this.tokens,
  });

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
