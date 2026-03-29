import 'package:json_annotation/json_annotation.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/user_response_model.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final UserResponseModel user;
  final Token token;
  final String message;

  LoginResponse({required this.user, required this.token, required this.message});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Token {
  final String refresh;
  final String access;

  Token({required this.refresh, required this.access});
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
