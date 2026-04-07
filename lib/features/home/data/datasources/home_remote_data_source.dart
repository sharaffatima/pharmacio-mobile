import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../models/dashboard_recent_activity_item.dart';
import '../models/dashboard_stats_response.dart';

abstract class HomeRemoteDataSource {
  Future<DashboardStatsResponse> getDashboardStats();

  Future<List<DashboardRecentActivityItem>> getDashboardRecentActivity();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  HomeRemoteDataSourceImpl({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<DashboardStatsResponse> getDashboardStats() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.dashboardStats,
        token: _accessToken,
      );
      return DashboardStatsResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<DashboardRecentActivityItem>> getDashboardRecentActivity() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.dashboardRecentActivity,
        token: _accessToken,
      );

      if (request is! List) {
        return [];
      }

      return request
          .whereType<Map<String, dynamic>>()
          .map(DashboardRecentActivityItem.fromJson)
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
