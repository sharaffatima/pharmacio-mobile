import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/login_response.dart';

part  'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(LoginResponse loginResponse) = Success;
  const factory LoginState.error({required String error}) = Error;
}
