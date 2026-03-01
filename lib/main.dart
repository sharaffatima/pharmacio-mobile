// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'core/di/dependency_injection.dart';
// import 'core/helpers/app_shared_preferences.dart';
// import 'core/helpers/my_bloc_observer.dart';
// import 'core/routing/app_router.dart';
// import 'pharmacio_mobile_app.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   setupGetit();
//   await ScreenUtil.ensureScreenSize();
//   await AppSharedPreferences().init();
//   Bloc.observer = MyBlocObserver();
//   runApp(PharmacioMobileApp(appRouter: AppRouter()));
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_mobile/core/routing/app_router.dart';
import 'package:pharmacio_flutter_mobile/pharmacio_app.dart';
// import 'package:pharmacio_flutter_mobile/Task/features/Proposal/presentation/secreens/proposal_screen.dart';
// import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/screens/inventory_screen.dart';
// import 'package:pharmacio_flutter_mobile/Task/features/profile/presentation/screens/profile_screen.dart';

// void main() {
//   runApp(const PharmacioApp());
// }

// class PharmacioApp extends StatelessWidget {
//   const PharmacioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(393, 852),
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,

//           home: ProfileScreen(),
//         );
//       },
//     );
//   }
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetit();
  await ScreenUtil.ensureScreenSize();
  await AppSharedPreferences().init();
  // Bloc.observer = MyBlocObserver();
  runApp(PharmacioMobileApp(appRouter: AppRouter()));
}
