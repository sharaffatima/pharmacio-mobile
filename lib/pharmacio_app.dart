import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/core/routing/app_router.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';

import 'core/constants/colors.dart';

class PharmacioMobileApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmacioMobileApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // Check if user is already logged in
    final accessToken =
        AppSharedPreferences().getString(AppSharedPrefKeys.accessToken);
    final isLoggedIn = accessToken != null && accessToken.isNotEmpty;

    return ScreenUtilInit(
      designSize: const Size(440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pharmacio Pharmacist Mobile App',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute:
              isLoggedIn ? Routes.homeScreen : Routes.loginScreen,
          theme: ThemeData(
            primaryColor: AppColors.forestGreen,
            scaffoldBackgroundColor: AppColors.white,
          ),
        );
      },
    );
  }
}
