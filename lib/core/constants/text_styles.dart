import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle font32BlackMedium = TextStyle(
    fontSize: 32.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font15BlackMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle font14GreyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.lightSlateDark,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.white,
  );
}
