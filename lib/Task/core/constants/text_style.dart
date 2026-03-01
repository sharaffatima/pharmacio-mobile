import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/font_size.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/fonts.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/fonts_weight.dart';

class AppTextStyles {
  static TextStyle appBar = TextStyle(
    color: AppColors.whiteLaight,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.extraBold,
    fontSize: AppFontSize.s24,
  );
  static TextStyle descriptionAppbar = TextStyle(
    color: AppColors.whiteLaight,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
    fontSize: AppFontSize.s16,
  );
  static TextStyle titelCard = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.bold,
    fontSize: AppFontSize.s16,
    color: AppColors.black,
  );
  static TextStyle labelCard = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s10,
    color: AppColors.black,
    fontWeight: AppFontWeight.regular,
  );
  static TextStyle searchBar = TextStyle(
    fontFamily: AppFonts.inter,
    color: AppColors.black,
    fontWeight: AppFontWeight.thin,
    fontSize: AppFontSize.s13,
  );
  static TextStyle filter = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.s13,
    fontWeight: AppFontWeight.medium,
  );
  static TextStyle inventoryItem = TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s14,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.black,
  );
  static TextStyle minStock = TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
    fontSize: AppFontSize.s11,
    color: AppColors.black,
  );
  static TextStyle currentStockCount(Color color) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: color);
  static TextStyle currentStock = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.s11,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
  );
  static TextStyle lastUpdate = TextStyle(
    fontSize: AppFontSize.s10,
    color: AppColors.black,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
  );
  static TextStyle outOfStockLabel = TextStyle(
    color: AppColors.redWarring,
    fontSize: AppFontSize.s11,
    fontWeight: AppFontWeight.semiBold,
  );
  static TextStyle lowStockLabel = TextStyle(
    color: AppColors.orangeLowInStock,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s11,
  );
  static TextStyle inStockLabel = TextStyle(
    color: AppColors.greenGood,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s11,
  );
  //propsal screen
  static TextStyle proposalCardTitle = TextStyle(
    fontFamily: AppFonts.inter,

    color: AppColors.black,
    fontWeight: AppFontWeight.semiBold,
    fontSize: AppFontSize.s13,
  );
  static TextStyle proposalDate = TextStyle(
    fontWeight: AppFontWeight.thin,
    color: AppColors.black,
    fontSize: 11.sp,
  );
  //profile screen
  static TextStyle accountInformation = TextStyle(
    fontFamily: AppFonts.inter,
    color: AppColors.black,
    fontWeight: AppFontWeight.semiBold,
    fontSize: 14.sp,
  );
  static TextStyle userName = TextStyle(
    fontSize: 17.sp,
    color: AppColors.black,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.semiBold,
  );
  static TextStyle userType = TextStyle(
    color: AppColors.white,
    fontSize: 12.sp,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.semiBold,
  );
  static TextStyle labelProfile = TextStyle(
    fontWeight: AppFontWeight.light,
    color: AppColors.black,
    fontSize: 12.sp,
  );
  static TextStyle valueProfile = TextStyle(
    color: AppColors.black,
    fontWeight: AppFontWeight.semiBold,
    fontSize: 12.sp,
    fontFamily: AppFonts.inter,
  );
}
