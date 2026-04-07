// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_recent_activity_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardRecentActivityItem _$DashboardRecentActivityItemFromJson(
  Map<String, dynamic> json,
) => DashboardRecentActivityItem(
  id: (json['id'] as num).toInt(),
  action: json['action'] as String,
  message: json['message'] as String,
  theme: json['theme'] as String,
  icon: json['icon'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  actor: json['actor'] as String,
);

Map<String, dynamic> _$DashboardRecentActivityItemToJson(
  DashboardRecentActivityItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'action': instance.action,
  'message': instance.message,
  'theme': instance.theme,
  'icon': instance.icon,
  'created_at': instance.createdAt?.toIso8601String(),
  'actor': instance.actor,
};
