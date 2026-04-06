import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../models/mark_notification_read_response.dart';
import '../models/notification_list_response.dart';

abstract class NotificationsRemoteDataSource {
  Future<NotificationListResponse> getMyNotifications({
    required bool unreadOnly,
    int limit,
  });

  Future<MarkNotificationReadResponse> markNotificationRead(int notificationId);
}

class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  NotificationsRemoteDataSourceImpl({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<NotificationListResponse> getMyNotifications({
    required bool unreadOnly,
    int limit = 20,
  }) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.notificationsMe,
        token: _accessToken,
        queryParams: {
          'unread_only': unreadOnly.toString(),
          'limit': limit.toString(),
        },
      );
      return NotificationListResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<MarkNotificationReadResponse> markNotificationRead(
    int notificationId,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.notifications}$notificationId/read/',
        token: _accessToken,
      );
      return MarkNotificationReadResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
