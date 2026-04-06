import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../../data/models/notification_list_response.dart';
import '../../data/repos/notifications_repo.dart';

part '../states/notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit(this._notificationsRepo)
    : super(const NotificationsState.initial());

  NotificationListResponse? _latestResponse;
  bool _isUnreadOnly = true;

  Future<void> getNotifications({
    bool? unreadOnly,
    int limit = 20,
    bool showLoading = true,
  }) async {
    final targetUnreadOnly = unreadOnly ?? _isUnreadOnly;
    _isUnreadOnly = targetUnreadOnly;

    if (showLoading) {
      emit(const NotificationsState.loading());
    }

    try {
      final response = await _notificationsRepo.getMyNotifications(
        unreadOnly: targetUnreadOnly,
        limit: limit,
      );
      _latestResponse = response;
      emit(
        NotificationsState.success(
          response: response,
          unreadOnly: targetUnreadOnly,
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(NotificationsState.error(error: message));
    }
  }

  Future<void> toggleFilter(bool unreadOnly) async {
    if (_isUnreadOnly == unreadOnly && _latestResponse != null) {
      return;
    }
    await getNotifications(unreadOnly: unreadOnly);
  }

  Future<void> markNotificationRead(int notificationId) async {
    final currentResponse = _latestResponse;
    if (currentResponse == null) {
      return;
    }

    final target = currentResponse.results.firstWhere(
      (item) => item.id == notificationId,
      orElse: () => currentResponse.results.first,
    );

    if (target.id != notificationId || target.isRead) {
      return;
    }

    emit(
      NotificationsState.success(
        response: currentResponse,
        unreadOnly: _isUnreadOnly,
        processingNotificationId: notificationId,
      ),
    );

    try {
      await _notificationsRepo.markNotificationRead(notificationId);
      final updatedItems = currentResponse.results
          .map(
            (item) =>
                item.id == notificationId ? item.copyWith(isRead: true) : item,
          )
          .toList();

      final updatedUnreadCount = updatedItems
          .where((item) => !item.isRead)
          .length;

      final updatedResponse = currentResponse.copyWith(
        unreadCount: updatedUnreadCount,
        results: updatedItems,
      );

      _latestResponse = updatedResponse;

      emit(
        NotificationsState.success(
          response: updatedResponse,
          unreadOnly: _isUnreadOnly,
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(
        NotificationsState.actionError(
          error: message,
          response: currentResponse,
          unreadOnly: _isUnreadOnly,
        ),
      );
      emit(
        NotificationsState.success(
          response: currentResponse,
          unreadOnly: _isUnreadOnly,
        ),
      );
    }
  }
}
