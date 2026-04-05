import 'package:flutter/material.dart';

class AppColors {
  static bool isDarkMode = false;

  static Color get background =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF6FFF7);
  static Color get surface =>
      isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);
  static Color get textPrimary =>
      isDarkMode ? const Color(0xFFF5F5F5) : const Color(0xFF111111);
  static Color get textSecondary =>
      isDarkMode ? const Color(0xFFBDBDBD) : const Color(0xFF616161);
  static Color get border =>
      isDarkMode ? const Color(0xFF3A3A3A) : const Color(0xFFC3C3C3);
  static Color get appBarBackground =>
      isDarkMode ? const Color(0xFF0D5D23) : backGroundAppBar;
  static Color get danger => isDarkMode ? const Color(0xFFE57373) : redError;

  // Neutral Colors
  static const Color white = Colors.white;
  static const Color gray = Colors.grey;
  static const Color backGroundAppBar = Color(0xff24A448);
  static const Color whiteLaight = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color backGroundBody = Color(0xffD5FFDD);
  // Cards Color
  static const Color forestGreen = Color(0xff049A2E);
  static const Color bluePrimary = Color(0xFF001CBC);
  static const Color greenSuccess = Color(0xFF218C00);
  static const Color orangeWarning = Color(0xFFF95B00);
  static const Color redError = Color(0xFFC90000);
  static const Color borderColor = Color(0xFFFFDEDE);
  //search bar
  static const Color offWhite = Color(0xFFF4F4F4);
  //labels Color
  static const Color redWarring = Color(0xffBF0000);
  static const Color greenGood = Color(0xff007C27);
  static const Color orangeLowInStock = Color(0xffA64200);
  //propsal color
  static const Color pendingStatusText = Color(0xffA54200);
  static const Color approvedStatusText = Color(0xff198800);
  static const Color rejectedStatusText = Color(0xff920000);
  static const Color circelBorder = Color(0xffC3C3C3);
  static Color blue = Colors.blue;
}
