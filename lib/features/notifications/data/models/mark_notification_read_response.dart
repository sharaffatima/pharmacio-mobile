import 'package:json_annotation/json_annotation.dart';

part 'mark_notification_read_response.g.dart';

@JsonSerializable()
class MarkNotificationReadResponse {
  final String message;

  const MarkNotificationReadResponse({required this.message});

  factory MarkNotificationReadResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationReadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarkNotificationReadResponseToJson(this);
}
