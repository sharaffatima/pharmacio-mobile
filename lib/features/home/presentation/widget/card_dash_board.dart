import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/fonts_weight.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';

class CardDashBourdWidget extends StatelessWidget {
  const CardDashBourdWidget({
    super.key,
    required this.type,
    required this.title,
    required this.value,
  });
  final EnumTypeAction type;
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      // height: 88.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.s10w200.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$value',
                style: AppTextStyles.s14w500.copyWith(
                  color: _setColorsIcons(),
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
              Icon(_setIcons(), color: _setColorsIcons(), size: 20.sp),
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

  IconData? _setIcons() {
    switch (type) {
      case EnumTypeAction.proposal:
        return Icons.insert_drive_file_rounded;
      case EnumTypeAction.alert:
        return Icons.trending_down_rounded;
      case EnumTypeAction.inventory:
        return Icons.inventory_2_outlined;
      case EnumTypeAction.stock:
        return Icons.warning_amber_rounded;
    }
  }
}
