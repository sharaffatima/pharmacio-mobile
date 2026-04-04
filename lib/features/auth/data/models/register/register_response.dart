import 'package:json_annotation/json_annotation.dart';

import '../login/login_response.dart';

part 'register_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponse {
  final User user;
  final Token token;
  final String message;

  RegisterResponse({
    required this.user,
    required this.token,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
