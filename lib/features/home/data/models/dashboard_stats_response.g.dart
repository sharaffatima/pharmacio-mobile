// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStatsResponse _$DashboardStatsResponseFromJson(
  Map<String, dynamic> json,
) => DashboardStatsResponse(
  activityAlerts: (json['activity_alerts'] as num).toInt(),
  lowStock: (json['low_stock'] as num).toInt(),
  proposals: (json['proposals'] as num).toInt(),
  inventory: (json['inventory'] as num).toInt(),
);

Map<String, dynamic> _$DashboardStatsResponseToJson(
  DashboardStatsResponse instance,
) => <String, dynamic>{
  'activity_alerts': instance.activityAlerts,
  'low_stock': instance.lowStock,
  'proposals': instance.proposals,
  'inventory': instance.inventory,
};
