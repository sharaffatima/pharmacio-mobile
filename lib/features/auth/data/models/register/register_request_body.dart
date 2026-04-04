import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String username;
  final String password;
  @JsonKey(name: 'password2')
  final String confirmPassword;

  RegisterRequestBody({
    required this.username,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
