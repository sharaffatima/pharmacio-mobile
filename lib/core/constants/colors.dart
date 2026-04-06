import 'package:flutter/material.dart';

class AppColors {
  static bool isDarkMode = false;

  static Color get background =>
      isDarkMode ? const Color(0xFF111417) : const Color(0xFFD5FFDD);
  static Color get surface =>
      isDarkMode ? const Color(0xFF1B2228) : const Color(0xFFFFFFFF);
  static Color get surfaceSoft =>
      isDarkMode ? const Color(0xFF242C34) : const Color(0xFFF4F4F4);
  static Color get textPrimary =>
      isDarkMode ? const Color(0xFFF1F5F9) : const Color(0xFF111111);
  static Color get textSecondary =>
      isDarkMode ? const Color(0xFFB8C2CC) : const Color(0xFF616161);
  static Color get border =>
      isDarkMode ? const Color(0xFF37424D) : const Color(0xFFC3C3C3);
  static Color get appBarBackground =>
      isDarkMode ? const Color(0xFF0D5D23) : backGroundAppBar;
  static Color get cameraBackground =>
      isDarkMode ? const Color(0xFF000000) : const Color(0xFF1E1E1E);
  static Color get danger => isDarkMode ? const Color(0xFFE57373) : redError;
  static Color get iconMuted =>
      isDarkMode ? const Color(0xFF8FA1B2) : const Color(0xFF5A5A5A);
  static Color get navBackground => surface;
  static Color get navSelected =>
      isDarkMode ? const Color(0xFF7EB4FF) : const Color(0xFF2962FF);
  static Color get navUnselected =>
      isDarkMode ? const Color(0xFF94A3B8) : const Color(0xFF607D8B);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static Color get gray =>
      isDarkMode ? const Color(0xFF93A1AF) : const Color(0xFF8E8E8E);
  static const Color backGroundAppBar = Color(0xff24A448);
  static Color get whiteLaight => white;
  static Color get black => textPrimary;
  static Color get backGroundBody => background;
  // Cards Color
  static const Color forestGreen = Color(0xff049A2E);
  static const Color bluePrimary = Color(0xFF001CBC);
  static const Color greenSuccess = Color(0xFF218C00);
  static const Color orangeWarning = Color(0xFFF95B00);
  static const Color redError = Color(0xFFC90000);
  static const Color borderColor = Color(0xFFFFDEDE);
  //search bar
  static Color get offWhite => surfaceSoft;
  //labels Color
  static const Color redWarring = Color(0xffBF0000);
  static const Color greenGood = Color(0xff007C27);
  static const Color orangeLowInStock = Color(0xffA64200);
  //propsal color
  static const Color pendingStatusText = Color(0xffA54200);
  static const Color approvedStatusText = Color(0xff198800);
  static const Color rejectedStatusText = Color(0xff920000);
  static Color get circelBorder => border;
}
