// import 'package:pharmacio_flutter_mobile/features/auth/data/datasources/remote/auth_remote_data_source.dart';
// import '../../../../core/networking/error/error_handler/network_exceptions.dart';
// import '../../../../core/networking/network_info.dart';
// import '../datasources/remote/login_remote_data_source.dart';
// import '../models/login_request_body.dart';
// import '../models/login_response.dart';

// class LoginRepo {
//   final AuthRemoteDataSource loginRemoteDataSource;
//   final NetworkInfo networkInfo;
//   LoginRepo({required this.loginRemoteDataSource, required this.networkInfo});

//   Future<LoginResponse> login(LoginRequestBody login) async {
//     final LoginRequestBody loginModel = LoginRequestBody(
//       username: login.username,
//       password: login.password,
//     );
//     if (await networkInfo.isConnected) {
//       try {
//         final loginResponse = await loginRemoteDataSource.login(loginModel);
//         return loginResponse;
//       } catch (e) {
//         final exception = NetworkExceptions.getException(e);
//         throw exception;
//       }
//     } else {
//       throw const NetworkExceptions.noInternetConnection();
//     }
//   }
// }
