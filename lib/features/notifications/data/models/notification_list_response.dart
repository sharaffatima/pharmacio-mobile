import 'package:json_annotation/json_annotation.dart';

import 'notification_item.dart';

part 'notification_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationListResponse {
  final int count;

  @JsonKey(name: 'unread_count')
  final int unreadCount;

  final List<NotificationItem> results;

  const NotificationListResponse({
    required this.count,
    required this.unreadCount,
    required this.results,
  });

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListResponseToJson(this);

  NotificationListResponse copyWith({
    int? count,
    int? unreadCount,
    List<NotificationItem>? results,
  }) {
    return NotificationListResponse(
      count: count ?? this.count,
      unreadCount: unreadCount ?? this.unreadCount,
      results: results ?? this.results,
    );
  }
}


