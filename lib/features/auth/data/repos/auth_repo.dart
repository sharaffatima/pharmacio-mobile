import 'package:dartz/dartz.dart';
import 'package:pharmacio_flutter_mobile/core/failure/failures.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/login_request_body.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/login_response.dart';

class AuthRepo {
  final AuthRemoteDataSource loginRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepo({required this.loginRemoteDataSource, required this.networkInfo});
  Future<Either<Failure, LoginResponse>> register(
    LoginRequestBody loginRequestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
              return await loginRemoteDataSource.register(loginRequestBody);
      } catch (e) {
        return left(Failure.handleError(e));
      }
    } else {
      return left(
        Failure(message: "No Internet Connection",),
      );
    }
  }
}
