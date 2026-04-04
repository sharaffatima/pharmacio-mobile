import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/change_password/change_password_request_body.dart';
import '../../data/models/change_password/change_password_response.dart';
import '../../data/models/login/login_request_body.dart';
import '../../data/models/login/login_response.dart';
import '../../data/models/logout/logout_response.dart';
import '../../data/models/me/me_response.dart';
import '../../data/models/register/register_request_body.dart';
import '../../data/models/register/register_response.dart';
import '../../data/repos/auth_repo.dart';

part '../states/auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(AuthState.initial());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (passwordController.text.length < 8) {
      emit(AuthState.error(error: "Password Should Be at Least 8 Characters"));
      return;
    }

    emit(AuthState.loading());

    try {
      final request = LoginRequestBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      final response = await _authRepo.login(request);

      emit(AuthState.successLogin(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AuthState.error(error: message));
    }
  }

  Future<void> register() async {
    if (passwordController.text.length < 8) {
      emit(AuthState.error(error: "Password Should Be at Least 8 Characters"));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      emit(AuthState.error(error: "Passwords do not match"));
      return;
    }

    emit(AuthState.loading());

    try {
      final request = RegisterRequestBody(
        username: usernameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );

      final response = await _authRepo.register(request);

      emit(AuthState.successRegister(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AuthState.error(error: message));
    }
  }

  Future<void> logout() async {
    emit(AuthState.loading());
    try {
      final response = await _authRepo.logout();
      emit(AuthState.successLogout(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AuthState.error(error: message));
    }
  }

  Future<void> getMe() async {
    emit(AuthState.loading());
    try {
      final response = await _authRepo.getMe();
      emit(AuthState.successGetMe(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AuthState.error(error: message));
    }
  }

  Future<void> changePassword() async {
    if (newPasswordController.text.length < 8) {
      emit(AuthState.error(error: 'Password must be at least 8 characters'));
      return;
    }
    if (newPasswordController.text != confirmNewPasswordController.text) {
      emit(AuthState.error(error: 'Passwords do not match'));
      return;
    }
    emit(AuthState.loading());
    try {
      final request = ChangePasswordRequestBody(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmNewPasswordController.text,
      );
      final response = await _authRepo.changePassword(request);
      emit(AuthState.successChangePassword(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AuthState.error(error: message));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
