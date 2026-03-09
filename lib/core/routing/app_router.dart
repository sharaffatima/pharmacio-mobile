import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/alert_screen.dart';


import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => AlertsPages(),
        );

      default:
        return null;
    }
  }
}
