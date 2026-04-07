import 'package:json_annotation/json_annotation.dart';

part 'dashboard_recent_activity_item.g.dart';

@JsonSerializable()
class DashboardRecentActivityItem {
  final int id;
  final String action;
  final String message;
  final String theme;
  final String icon;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  final String actor;

  const DashboardRecentActivityItem({
    required this.id,
    required this.action,
    required this.message,
    required this.theme,
    required this.icon,
    required this.createdAt,
    required this.actor,
  });

  factory DashboardRecentActivityItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardRecentActivityItemFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardRecentActivityItemToJson(this);
}
