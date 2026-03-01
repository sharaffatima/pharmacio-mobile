import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            // create: (context) => getIt<LoginCubit>(),
            child: LoginPage(),
          ),
        );

      default:
        return null;
    }
  }
}
