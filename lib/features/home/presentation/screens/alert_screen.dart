import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
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
          headerAlertPage(),
          verticalSpace(12.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    cardNotificationWidget(type: EnumTypeAction.stock),
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

class cardNotificationWidget extends StatelessWidget {
  const cardNotificationWidget({super.key, required this.type});

  final EnumTypeAction type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
                  'Critical Low Stock',
                  style: AppTextStyles.s15w500.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Aspirin 500mg has reached critical stock level (5 units remaining)  ',
                  style: AppTextStyles.proposalDate,
                ),
                Text(
                  '5 hours ',
                  style: AppTextStyles.s12w400.copyWith(
                    color: const Color.fromARGB(191, 78, 78, 78),
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
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'warning',
                  style: AppTextStyles.s12w400.copyWith(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(221, 219, 218, 218),
                    width: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Acknowledge',
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
        return Colors.blue;
      case EnumTypeAction.alert:
        return Colors.red;
      case EnumTypeAction.inventory:
        return Colors.green;
      case EnumTypeAction.stock:
        return Colors.deepOrange;
    }
  }
}

class headerAlertPage extends StatelessWidget {
  const headerAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff24A448),
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
            'Alerts',
            style: AppTextStyles.s20w700.copyWith(color: Colors.white),
          ),
          verticalSpace(1.h),
          Text(
            'Monitor system alerts and notifications',
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xfff7f7f7),
            ),
          ),
          verticalSpace(15.h),
        ],
      ),
    );
  }
}
