import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';
import 'colors.dart';

// class AppTextStyles {
//   static TextStyle font32BlackMedium = TextStyle(
//     fontSize: 32.sp,
//     fontWeight: AppFontWeightHelper.medium,
//     color: AppColors.black,
//   );
//   static TextStyle font15BlackMedium = TextStyle(
//     fontSize: 15.sp,
//     fontWeight: AppFontWeightHelper.medium,
//     color: AppColors.black,
//   );
//   static TextStyle font14BlackMedium = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: AppFontWeightHelper.medium,
//     color: AppColors.black,
//   );
//   static TextStyle font14GreyMedium = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: AppFontWeightHelper.medium,
//     color: AppColors.lightSlateDark,
//   );
//   static TextStyle font16WhiteMedium = TextStyle(
//     fontSize: 16.sp,
//     fontWeight: AppFontWeightHelper.medium,
//     color: AppColors.white,
//   );
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static const String _fontFamily = 'Inter';
  static const String fontGeist = 'Geist';

  static TextStyle _baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? height,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: _fontFamily,
        height: height,
      );

  //?------------ Types ---------------------------------

  static TextStyle get s12w400 => _baseStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle get s14w400 => _baseStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle get s14w500 => _baseStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle get s14w600 => _baseStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle get s16w400 => _baseStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle get s16w500 => _baseStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle get s16w600 => _baseStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle get s18w600 => _baseStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle get s20w600 => _baseStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  //?----------------------------------------------------
}
