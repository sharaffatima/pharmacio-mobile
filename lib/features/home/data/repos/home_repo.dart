import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';

import '../datasources/home_remote_data_source.dart';
import '../models/dashboard_recent_activity_item.dart';
import '../models/dashboard_stats_response.dart';

class HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepo({required this.homeRemoteDataSource, required this.networkInfo});

  Future<DashboardStatsResponse> getDashboardStats() async {
    if (await networkInfo.isConnected) {
      try {
        return await homeRemoteDataSource.getDashboardStats();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<DashboardRecentActivityItem>> getDashboardRecentActivity() async {
    if (await networkInfo.isConnected) {
      try {
        return await homeRemoteDataSource.getDashboardRecentActivity();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
