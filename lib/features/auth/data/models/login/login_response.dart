import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  final User user;
  final List<String> roles;
  final List<String> permissions;
  final Token token;
  final String message;

  LoginResponse({
    required this.user,
    required this.roles,
    required this.permissions,
    required this.token,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String email;
  
  @JsonKey(name: "first_name")
  final String firstName;
  
  @JsonKey(name: "last_name")
  final String lastName;
  
  final List<String> roles;
  
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  
  @JsonKey(name: "is_active")
  final bool isActive;
  
  @JsonKey(name: "date_joined")
  final DateTime dateJoined; 

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roles,
    this.phoneNumber,
    required this.isActive,
    required this.dateJoined,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Token {
  final String refresh;
  final String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}