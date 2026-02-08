import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/colors.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class PharmacioMobileApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmacioMobileApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pharmacio Pharmacist Mobile App',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.loginScreen,
          theme: ThemeData(
            primaryColor: AppColors.forestGreen,
            scaffoldBackgroundColor: AppColors.white,
          ),
        );
      },
    );
  }
}
