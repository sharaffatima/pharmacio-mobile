import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

class RowActionWidget extends StatelessWidget {
  const RowActionWidget({
    super.key,
    required this.title,
    required this.dataTime,
    required this.type,
  });
  final String title;
  final String dataTime;
  final EnumTypeAction type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: _setColorsBack(),
            ),
            child: Icon(_setIcons(), color: _setColorsIcons(), size: 16),
          ),
          horizontalSpace(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.s12w400),
              Text(
                '$dataTime ',
                style: AppTextStyles.s10w200.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color? _setColorsBack() {
    switch (type) {
      case EnumTypeAction.proposal:
        return AppColors.bluePrimary.withValues(alpha: 0.20);

      case EnumTypeAction.alert:
        return AppColors.redError.withValues(alpha: 0.18);

      case EnumTypeAction.inventory:
        return AppColors.greenSuccess.withValues(alpha: 0.20);
      case EnumTypeAction.stock:
        return AppColors.orangeWarning.withValues(alpha: 0.20);
    }
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
