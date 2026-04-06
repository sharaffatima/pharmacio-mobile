import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../models/sales_request.dart';
import '../models/sales_response.dart';

abstract class SalesRemoteDataSource {
  Future<SalesResponseModel> recordSale(SalesRequestModel request);
}

class SalesRemoteDataSourceImpl implements SalesRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  SalesRemoteDataSourceImpl({required this.apiServicesImpl});

  Future<String> _getToken() async {
    final rawToken =
        AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
        AppSharedPreferences().getString(AppSharedPrefKeys.token);

    if (rawToken == null || rawToken.isEmpty) {
      throw const NetworkExceptions.loggingInRequired();
    }

    return rawToken.startsWith('Bearer ')
        ? rawToken.substring(7).trim()
        : rawToken.trim();
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
