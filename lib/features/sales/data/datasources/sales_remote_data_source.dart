import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/sales_request.dart';
import '../models/sales_response.dart';

abstract class SalesRemoteDataSource {
  Future<SalesResponseModel> recordSale(SalesRequestModel request);
}

class SalesRemoteDataSourceImpl implements SalesRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  SalesRemoteDataSourceImpl({required this.apiServicesImpl});

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token == null) throw Exception("Unauthorized");
    return token;
  }

  @override
  Future<SalesResponseModel> recordSale(SalesRequestModel request) async {
    try {
      final token = await _getToken();
      final response = await apiServicesImpl.post(
        AppLinkUrl.recordSale,
        token: token,
        body: request.toJson(),
      );
      return SalesResponseModel.fromJson(response);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
