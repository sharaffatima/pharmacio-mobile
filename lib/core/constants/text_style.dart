import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/font_size.dart';
import 'package:pharmacio_flutter_mobile/core/constants/fonts.dart';
import 'package:pharmacio_flutter_mobile/core/constants/fonts_weight.dart';

class AppTextStyles {
  static TextStyle get appBar => TextStyle(
    color: AppColors.whiteLaight,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.extraBold,
    fontSize: AppFontSize.s24,
  );

  static TextStyle get descriptionAppbar => TextStyle(
    color: AppColors.whiteLaight,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
    fontSize: AppFontSize.s16,
  );

  static TextStyle get titelCard => TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.bold,
    fontSize: AppFontSize.s16,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelCard => TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s10,
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle get searchBar => TextStyle(
    fontFamily: AppFonts.inter,
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.thin,
    fontSize: AppFontSize.s13,
  );

  static TextStyle get filter => TextStyle(
    color: AppColors.textPrimary,
    fontSize: AppFontSize.s13,
    fontWeight: AppFontWeight.medium,
  );

  static TextStyle get inventoryItem => TextStyle(
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s14,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.textPrimary,
  );

  static TextStyle get minStock => TextStyle(
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
    fontSize: AppFontSize.s11,
    color: AppColors.textPrimary,
  );

  static TextStyle currentStockCount(Color color) =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: color);

  static TextStyle get currentStock => TextStyle(
    color: AppColors.textPrimary,
    fontSize: AppFontSize.s11,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
  );

  static TextStyle get lastUpdate => TextStyle(
    fontSize: AppFontSize.s10,
    color: AppColors.textPrimary,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.light,
  );

  static TextStyle get outOfStockLabel => TextStyle(
    color: AppColors.redWarring,
    fontSize: AppFontSize.s11,
    fontWeight: AppFontWeight.semiBold,
  );

  static TextStyle get lowStockLabel => TextStyle(
    color: AppColors.orangeLowInStock,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s11,
  );

  static TextStyle get inStockLabel => TextStyle(
    color: AppColors.greenGood,
    fontWeight: AppFontWeight.semiBold,
    fontFamily: AppFonts.inter,
    fontSize: AppFontSize.s11,
  );

  static TextStyle get proposalCardTitle => TextStyle(
    fontFamily: AppFonts.inter,
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.semiBold,
    fontSize: AppFontSize.s13,
  );

  static TextStyle get proposalDate => TextStyle(
    fontWeight: AppFontWeight.thin,
    color: AppColors.textPrimary,
    fontSize: 11.sp,
  );

  static TextStyle get accountInformation => TextStyle(
    fontFamily: AppFonts.inter,
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.semiBold,
    fontSize: 14.sp,
  );

  static TextStyle get userName => TextStyle(
    fontSize: 17.sp,
    color: AppColors.textPrimary,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.semiBold,
  );

  static TextStyle get userType => TextStyle(
    color: AppColors.white,
    fontSize: 12.sp,
    fontFamily: AppFonts.inter,
    fontWeight: AppFontWeight.semiBold,
  );

  static TextStyle get labelProfile => TextStyle(
    fontWeight: AppFontWeight.light,
    color: AppColors.textPrimary,
    fontSize: 12.sp,
  );

  static TextStyle get valueProfile => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.semiBold,
    fontSize: 12.sp,
    fontFamily: AppFonts.inter,
  );

  static TextStyle get s32w500 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.medium,
    fontSize: 32.sp,
    fontFamily: AppFonts.inter,
  );
  static TextStyle get s36w500 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.bold,
    fontSize: 36.sp,
    fontFamily: AppFonts.inter,
  );


  static TextStyle get s15w500 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.medium,
    fontSize: 15.sp,
    fontFamily: AppFonts.inter,
  );

  static TextStyle get s14w500 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.medium,
    fontSize: 14.sp,
    fontFamily: AppFonts.inter,
  );

  static TextStyle get s12w400 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.regular,
    fontSize: 12.sp,
    fontFamily: AppFonts.inter,
  );

  static TextStyle get s14w400 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.regular,
    fontSize: 14.sp,
    fontFamily: AppFonts.inter,
  );

  static TextStyle get s10w200 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.thin,
    fontSize: 10.sp,
    fontFamily: AppFonts.inter,
  );

  static TextStyle get s20w700 => TextStyle(
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.bold,
    fontSize: 20.sp,
    fontFamily: AppFonts.inter,
  );
}
