part of '../cubits/auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.successLogin(LoginResponse loginResponse) =
      SuccessLogin;
  const factory AuthState.successRegister(RegisterResponse registerResponse) =
      SuccessRegister;
  const factory AuthState.successLogout(LogoutResponse logoutResponse) =
      SuccessLogout;
  const factory AuthState.successGetMe(MeResponse meResponse) = SuccessGetMe;
  const factory AuthState.successChangePassword(
    ChangePasswordResponse changePasswordResponse,
  ) = SuccessChangePassword;
  const factory AuthState.error({required String error}) = Error;
}
