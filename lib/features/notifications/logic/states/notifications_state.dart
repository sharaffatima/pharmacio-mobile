part of '../cubits/notifications_cubit.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.loading() = NotificationsLoading;
  const factory NotificationsState.success({
    required NotificationListResponse response,
    required bool unreadOnly,
    int? processingNotificationId,
  }) = NotificationsSuccess;
  const factory NotificationsState.error({required String error}) =
      NotificationsError;
  const factory NotificationsState.actionError({
    required String error,
    required NotificationListResponse response,
    required bool unreadOnly,
  }) = NotificationsActionError;
}
