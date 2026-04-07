import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/features/home/data/models/dashboard_recent_activity_item.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/row_action_widget.dart';

class RecentActivityShowWidget extends StatelessWidget {
  const RecentActivityShowWidget({
    super.key,
    required this.recentActivities,
    required this.isLoading,
    required this.errorMessage,
    required this.onRetry,
  });

  final List<DashboardRecentActivityItem> recentActivities;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final hasError = errorMessage != null && recentActivities.isEmpty;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 27.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.recentActivity, style: AppTextStyles.s14w400),
          verticalSpace(12.h),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (hasError)
            Center(
              child: Column(
                children: [
                  Text(
                    errorMessage!,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.redError,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(10.h),
                  RetryWidget(onPressed: onRetry),
                ],
              ),
            )
          else if (recentActivities.isEmpty)
            Text(
              AppStrings.noNotifications,
              style: AppTextStyles.s12w400.copyWith(
                color: AppColors.textSecondary,
              ),
            )
          else
            Column(
              children: recentActivities
                  .take(5)
                  .map(
                    (activity) => RowActionWidget(
                      title: activity.message,
                      dataTime: _formatDate(activity.createdAt),
                      type: _mapActivityToType(activity),
                    ),
                  )
                  .toList(),
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

  EnumTypeAction _mapActivityToType(DashboardRecentActivityItem activity) {
    final normalizedAction = activity.action.toLowerCase();
    final normalizedTheme = activity.theme.toLowerCase();
    final normalizedIcon = activity.icon.toLowerCase();

    if (normalizedAction.contains('proposal')) {
      return EnumTypeAction.proposal;
    }

    if (normalizedAction.contains('inventory') ||
        normalizedIcon.contains('inventory')) {
      return EnumTypeAction.inventory;
    }

    if (normalizedAction.contains('alert') ||
        normalizedTheme.contains('red') ||
        normalizedIcon.contains('warning')) {
      return EnumTypeAction.alert;
    }

    if (normalizedTheme.contains('green') ||
        normalizedAction.contains('sale') ||
        normalizedAction.contains('uploaded') ||
        normalizedIcon.contains('cash') ||
        normalizedIcon.contains('upload')) {
      return EnumTypeAction.stock;
    }

    return EnumTypeAction.inventory;
  }
}
