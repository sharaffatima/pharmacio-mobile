import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

import '../../data/models/notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final bool isProcessing;
  final VoidCallback? onMarkRead;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.isProcessing,
    this.onMarkRead,
  });

  @override
  Widget build(BuildContext context) {
    final typeColor = _setColor(notification.type);
    final canMarkRead =
        !notification.isRead && !isProcessing && onMarkRead != null;

    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded, color: typeColor, size: 18.sp),
          horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatType(notification.type),
                  style: AppTextStyles.s15w500.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(2.h),
                Text(notification.message, style: AppTextStyles.proposalDate),
                verticalSpace(4.h),
                Text(
                  _formatDate(notification.createdAt),
                  style: AppTextStyles.s12w400.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: notification.isRead
                        ? AppColors.iconMuted
                        : typeColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    notification.isRead
                        ? AppStrings.read
                        : _formatType(notification.type),
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                InkWell(
                  onTap: canMarkRead ? onMarkRead : null,
                  borderRadius: BorderRadius.circular(6.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: canMarkRead
                          ? AppColors.surface
                          : AppColors.surfaceSoft,
                      border: Border.all(color: AppColors.border, width: 0.3),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: isProcessing
                        ? SizedBox(
                            width: 9.w,
                            height: 9.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1.3,
                              color: AppColors.forestGreen,
                            ),
                          )
                        : Text(
                            notification.isRead
                                ? AppStrings.read
                                : AppStrings.markAsRead,
                            style: AppTextStyles.s12w400.copyWith(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w100,
                              color: notification.isRead
                                  ? AppColors.iconMuted
                                  : AppColors.textPrimary,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return AppStrings.justNow;
    }

    final difference = DateTime.now().difference(date);

    if (difference.inMinutes < 1) {
      return AppStrings.justNow;
    }

    if (difference.inHours < 1) {
      return '${difference.inMinutes} ${AppStrings.minAgo}';
    }

    if (difference.inDays < 1) {
      return '${difference.inHours} ${AppStrings.hourAgo}';
    }

    return '${difference.inDays} ${AppStrings.dayAgo}';
  }

  String _formatType(String type) {
    if (type.isEmpty) {
      return '';
    }
    final words = type.replaceAll('_', ' ').split(' ');
    return words
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  Color _setColor(String type) {
    final normalized = type.toLowerCase();

    if (normalized.contains('critical') ||
        normalized.contains('alert') ||
        normalized.contains('error')) {
      return AppColors.redError;
    }
    if (normalized.contains('warning')) {
      return AppColors.orangeWarning;
    }
    if (normalized.contains('success')) {
      return AppColors.greenSuccess;
    }

    return AppColors.bluePrimary;
  }
}
