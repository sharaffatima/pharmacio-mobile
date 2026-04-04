import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/change_password/change_password_request_body.dart';
import '../models/change_password/change_password_response.dart';
import '../models/login/login_request_body.dart';
import '../models/login/login_response.dart';
import '../models/logout/logout_response.dart';
import '../models/me/me_response.dart';
import '../models/register/register_request_body.dart';
import '../models/register/register_response.dart';

class AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  AuthRepo({required this.authRemoteDataSource, required this.networkInfo});

  Future<LoginResponse> login(LoginRequestBody login) async {
    if (await networkInfo.isConnected) {
      try {
        return await authRemoteDataSource.login(
          LoginRequestBody(username: login.username, password: login.password),
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<RegisterResponse> register(RegisterRequestBody register) async {
    if (await networkInfo.isConnected) {
      try {
        return await authRemoteDataSource.register(
          RegisterRequestBody(
            username: register.username,
            password: register.password,
            confirmPassword: register.confirmPassword,
          ),
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<LogoutResponse> logout() async {
    if (await networkInfo.isConnected) {
      try {
        return await authRemoteDataSource.logout();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<MeResponse> getMe() async {
    if (await networkInfo.isConnected) {
      try {
        return await authRemoteDataSource.getMe();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await authRemoteDataSource.changePassword(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
