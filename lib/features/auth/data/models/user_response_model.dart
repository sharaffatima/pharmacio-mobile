import 'package:json_annotation/json_annotation.dart';
part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  final List<String> roles;
  @JsonKey(name: 'phone_number')
  final String phone;
  @JsonKey(name: 'is_active')
  final String isActive;

  UserResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.roles,
    required this.phone,
    required this.isActive,
  });
  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
