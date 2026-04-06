// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationListResponse _$NotificationListResponseFromJson(
  Map<String, dynamic> json,
) => NotificationListResponse(
  count: (json['count'] as num).toInt(),
  unreadCount: (json['unread_count'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotificationListResponseToJson(
  NotificationListResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'unread_count': instance.unreadCount,
  'results': instance.results.map((e) => e.toJson()).toList(),
};
