import 'package:dio/dio.dart';

import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginRequestBody loginRequestBody);
}

class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  LoginRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.login,
        body: {
          'email': loginRequestBody.email,
          'password': loginRequestBody.password,
        },
      );
      final response = LoginResponse.fromJson(request);

      return response;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
