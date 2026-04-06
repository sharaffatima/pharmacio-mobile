import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';

import '../../data/models/notification_list_response.dart';
import '../../logic/cubits/notifications_cubit.dart';
import '../widgets/notification_card.dart';
import '../widgets/notification_filter_toggle.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      body: SafeArea(
        child: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
            state.maybeWhen(
              actionError: (error, _, __) {
                showAppSnackBar(
                  context,
                  message: error,
                  backgroundColor: AppColors.redError,
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const LoadingWidget(),
              error: (error) => _ErrorState(
                error: error,
                onRetry: () {
                  context.read<NotificationsCubit>().getNotifications();
                },
              ),
              actionError: (_, response, unreadOnly) =>
                  _ContentState(response: response, unreadOnly: unreadOnly),
              success: (response, unreadOnly, processingNotificationId) =>
                  _ContentState(
                    response: response,
                    unreadOnly: unreadOnly,
                    processingNotificationId: processingNotificationId,
                  ),
            );
          },
        ),
      ),
    );
  }
}

class _ContentState extends StatelessWidget {
  final NotificationListResponse response;
  final bool unreadOnly;
  final int? processingNotificationId;

  const _ContentState({
    required this.response,
    required this.unreadOnly,
    this.processingNotificationId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderAlertPage(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                verticalSpace(12.h),
                NotificationFilterToggle(
                  unreadOnly: unreadOnly,
                  onChanged: (value) {
                    context.read<NotificationsCubit>().toggleFilter(value);
                  },
                ),
                verticalSpace(10.h),
                Row(
                  children: [
                    _StatBadge(
                      label: AppStrings.total,
                      value: response.count.toString(),
                    ),
                    SizedBox(width: 8.w),
                    _StatBadge(
                      label: AppStrings.unread,
                      value: response.unreadCount.toString(),
                      backgroundColor: AppColors.redError.withValues(
                        alpha: 0.88,
                      ),
                      textColor: AppColors.white,
                    ),
                  ],
                ),
                verticalSpace(12.h),
                Expanded(
                  child: response.results.isEmpty
                      ? const _EmptyState()
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            final item = response.results[index];
                            return NotificationCard(
                              notification: item,
                              isProcessing: item.id == processingNotificationId,
                              onMarkRead: () {
                                context
                                    .read<NotificationsCubit>()
                                    .markNotificationRead(item.id);
                              },
                            );
                          },
                          separatorBuilder: (context, _) => verticalSpace(10.h),
                          itemCount: response.results.length,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color? backgroundColor;
  final Color? textColor;

  const _StatBadge({
    required this.label,
    required this.value,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedTextColor = textColor ?? AppColors.textPrimary;
    final resolvedBackgroundColor = backgroundColor ?? AppColors.surface;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: resolvedBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.s12w400.copyWith(color: resolvedTextColor),
          children: [
            TextSpan(text: '$label: '),
            TextSpan(
              text: value,
              style: AppTextStyles.s12w400.copyWith(
                color: resolvedTextColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 42.sp,
            color: AppColors.gray,
          ),
          verticalSpace(12.h),
          Text(AppStrings.noNotifications, style: AppTextStyles.s14w500),
          verticalSpace(6.h),
          Text(
            AppStrings.notificationsRetryHint,
            style: AppTextStyles.s12w400.copyWith(color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: AppColors.redError, size: 42.sp),
            verticalSpace(12.h),
            Text(
              error,
              style: AppTextStyles.s14w500.copyWith(color: AppColors.redError),
              textAlign: TextAlign.center,
            ),
            verticalSpace(16.h),
            RetryWidget(onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}

class _HeaderAlertPage extends StatelessWidget {
  const _HeaderAlertPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.appBarBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20.h),
          Text(
            AppStrings.alertsTitle,
            style: AppTextStyles.s20w700.copyWith(color: AppColors.white),
          ),
          verticalSpace(1.h),
          Text(
            AppStrings.alertsSubtitle,
            style: AppTextStyles.s12w400.copyWith(
              color: AppColors.white.withValues(alpha: 0.92),
            ),
          ),
          verticalSpace(12.h),
        ],
      ),
    );
  }
}
