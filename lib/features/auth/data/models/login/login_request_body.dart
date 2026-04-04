import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String username;
  final String password;

  LoginRequestBody({required this.username, required this.password});

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
