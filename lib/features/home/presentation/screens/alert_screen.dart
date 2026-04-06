import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

class AlertsPages extends StatelessWidget {
  const AlertsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      body: Column(
        children: [
          HeaderAlertPage(),
          verticalSpace(12.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    CardNotificationWidget(type: EnumTypeAction.stock),
                separatorBuilder: (context, _) => verticalSpace(10.h),
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardNotificationWidget extends StatelessWidget {
  const CardNotificationWidget({super.key, required this.type});

  final EnumTypeAction type;

  @override
  Widget build(BuildContext context) {
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
          Icon(Icons.warning_amber_rounded, color: _setColorsIcons(), size: 18),
          horizontalSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.criticalLowStock,
                  style: AppTextStyles.s15w500.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  AppStrings.criticalLowStockMessage,
                  style: AppTextStyles.proposalDate,
                ),
                Text(
                  AppStrings.fiveHoursAgo,
                  style: AppTextStyles.s12w400.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.redError,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppStrings.warning,
                  style: AppTextStyles.s12w400.copyWith(
                    color: AppColors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border.all(color: AppColors.border, width: 0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppStrings.acknowledge,
                  style: AppTextStyles.s12w400.copyWith(
                    fontSize: 8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color? _setColorsIcons() {
    switch (type) {
      case EnumTypeAction.proposal:
        return AppColors.bluePrimary;
      case EnumTypeAction.alert:
        return AppColors.redError;
      case EnumTypeAction.inventory:
        return AppColors.greenSuccess;
      case EnumTypeAction.stock:
        return AppColors.orangeWarning;
    }
  }
}

class HeaderAlertPage extends StatelessWidget {
  const HeaderAlertPage({super.key});

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
          verticalSpace(25.h),
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
          verticalSpace(15.h),
        ],
      ),
    );
  }
}
