import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/core/logic/cubits/language_cubit.dart';
import 'package:pharmacio_flutter_mobile/core/logic/cubits/theme_cubit.dart';
import 'package:pharmacio_flutter_mobile/core/routing/app_router.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';

import 'core/constants/colors.dart';

class PharmacioMobileApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmacioMobileApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final accessToken = AppSharedPreferences().getString(
      AppSharedPrefKeys.accessToken,
    );
    final isLoggedIn = accessToken != null && accessToken.isNotEmpty;

    return ScreenUtilInit(
      designSize: const Size(440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LanguageCubit>(
              create: (_) => LanguageCubit()..loadInitialLanguage(),
            ),
            BlocProvider<ThemeCubit>(
              create: (_) => ThemeCubit()..loadInitialTheme(),
            ),
          ],
          child: BlocBuilder<LanguageCubit, String>(
            builder: (context, currentLanguage) {
              AppStrings.currentLanguage = currentLanguage;
              return BlocBuilder<ThemeCubit, bool>(
                builder: (context, isDark) {
                  AppColors.isDarkMode = isDark;
                  final baseTheme = ThemeData(
                    brightness: isDark ? Brightness.dark : Brightness.light,
                    useMaterial3: true,
                  );
                  final colorScheme =
                      ColorScheme.fromSeed(
                        seedColor: AppColors.forestGreen,
                        brightness: isDark ? Brightness.dark : Brightness.light,
                      ).copyWith(
                        surface: AppColors.surface,
                        onSurface: AppColors.textPrimary,
                        outline: AppColors.border,
                      );

                  return Directionality(
                    textDirection: currentLanguage == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: AppStrings.appTitle,
                      onGenerateRoute: appRouter.generateRoute,
                      initialRoute: isLoggedIn
                          ? Routes.homeScreen
                          : Routes.loginScreen,
                      theme: baseTheme.copyWith(
                        colorScheme: colorScheme,
                        primaryColor: AppColors.forestGreen,
                        scaffoldBackgroundColor: AppColors.background,
                        cardColor: AppColors.surface,
                        dividerColor: AppColors.border,
                        appBarTheme: AppBarTheme(
                          backgroundColor: AppColors.appBarBackground,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                        ),
                        bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          backgroundColor: AppColors.navBackground,
                          selectedItemColor: AppColors.navSelected,
                          unselectedItemColor: AppColors.navUnselected,
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: AppColors.surfaceSoft,
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.border),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: AppColors.border),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.forestGreen,
                              width: 1.3,
                            ),
                          ),
                        ),
                        textTheme: baseTheme.textTheme.apply(
                          bodyColor: AppColors.textPrimary,
                          displayColor: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
