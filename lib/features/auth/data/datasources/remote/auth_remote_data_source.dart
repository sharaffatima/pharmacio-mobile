import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/failure/failures.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/login_request_body.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, LoginResponse>> register(
    LoginRequestBody loginRequestBody,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  AuthRemoteDataSourceImpl({required this.apiServicesImpl});
  @override
  Future<Either<Failure, LoginResponse>> register(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.register,
        body: {
          "username": loginRequestBody.username,
          "password": loginRequestBody.password,
          "password2": loginRequestBody.password,
        },
      );
      var data = LoginResponse.fromJson(request);
      return right(data);
    } catch (error) {
      return left(Failure.handleError(error));
    }
  }
}
