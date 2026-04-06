import 'package:json_annotation/json_annotation.dart';

part 'notification_item.g.dart';

@JsonSerializable()
class NotificationItem {
  final int id;

  @JsonKey(name: 'notification_id')
  final int notificationId;

  final String type;

  final String message;

  @JsonKey(name: 'is_read')
  final bool isRead;

  @JsonKey(name: 'read_at')
  final DateTime? readAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const NotificationItem({
    required this.id,
    required this.notificationId,
    required this.type,
    required this.message,
    required this.isRead,
    required this.readAt,
    required this.createdAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);

  NotificationItem copyWith({
    int? id,
    int? notificationId,
    String? type,
    String? message,
    bool? isRead,
    DateTime? readAt,
    DateTime? createdAt,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      notificationId: notificationId ?? this.notificationId,
      type: type ?? this.type,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
