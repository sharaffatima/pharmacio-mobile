part of '../cubits/home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading({
    DashboardStatsResponse? dashboardStats,
    List<DashboardRecentActivityItem>? recentActivities,
  }) = HomeLoading;

  const factory HomeState.loaded({
    DashboardStatsResponse? dashboardStats,
    @Default(<DashboardRecentActivityItem>[])
    List<DashboardRecentActivityItem> recentActivities,
  }) = HomeLoaded;

  const factory HomeState.error({
    required String error,
    DashboardStatsResponse? dashboardStats,
    List<DashboardRecentActivityItem>? recentActivities,
  }) = HomeError;
}
