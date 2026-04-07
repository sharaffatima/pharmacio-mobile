import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:pharmacio_flutter_mobile/features/home/data/models/dashboard_recent_activity_item.dart';
import 'package:pharmacio_flutter_mobile/features/home/data/models/dashboard_stats_response.dart';
import 'package:pharmacio_flutter_mobile/features/home/data/repos/home_repo.dart';

part '../states/home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  DashboardStatsResponse? dashboardStats;
  List<DashboardRecentActivityItem> recentActivities = [];

  Future<void> loadHomeDashboard({bool showLoading = true}) async {
    if (showLoading) {
      emit(
        HomeState.loading(
          dashboardStats: dashboardStats,
          recentActivities: recentActivities,
        ),
      );
    }

    try {
      final responses = await Future.wait<dynamic>([
        _homeRepo.getDashboardStats(),
        _homeRepo.getDashboardRecentActivity(),
      ]);

      dashboardStats = responses[0] as DashboardStatsResponse;
      recentActivities = responses[1] as List<DashboardRecentActivityItem>;

      emit(
        HomeState.loaded(
          dashboardStats: dashboardStats,
          recentActivities: recentActivities,
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(
        HomeState.error(
          error: message,
          dashboardStats: dashboardStats,
          recentActivities: recentActivities,
        ),
      );
    }
  }
}
