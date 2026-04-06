import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';

import '../datasources/notifications_remote_data_source.dart';
import '../models/mark_notification_read_response.dart';
import '../models/notification_list_response.dart';

class NotificationsRepo {
  final NotificationsRemoteDataSource notificationsRemoteDataSource;
  final NetworkInfo networkInfo;

  NotificationsRepo({
    required this.notificationsRemoteDataSource,
    required this.networkInfo,
  });

  Future<NotificationListResponse> getMyNotifications({
    required bool unreadOnly,
    int limit = 20,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await notificationsRemoteDataSource.getMyNotifications(
          unreadOnly: unreadOnly,
          limit: limit,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<MarkNotificationReadResponse> markNotificationRead(
    int notificationId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await notificationsRemoteDataSource.markNotificationRead(
          notificationId,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
