import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/space_helpers.dart';

Widget buildStatCard(String value, String label, Color color) {
  return Container(
    width: 83.w,
    height: 70.h,
    decoration: BoxDecoration(
      color: AppColors.whiteLaight,
      borderRadius: BorderRadius.circular(7.r),
      border: Border.all(color: AppColors.borderColor, width: 1.w),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value, style: AppTextStyles.titelCard.copyWith(color: color)),
        verticalSpace(2),

        Text(label, style: AppTextStyles.labelCard),
      ],
    ),
  );
}
