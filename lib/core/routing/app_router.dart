import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/home_page.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/scan_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => HomePage());

      case Routes.scanScreen:
        final tabIndex = settings.arguments is int
            ? settings.arguments as int
            : 0;
        return MaterialPageRoute(
          builder: (_) => ScanScreen(initialTabIndex: tabIndex),
        );

      default:
        return null;
    }
  }
}
