import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:pharmacio_flutter_mobile/features/auth/presentation/screens/register_screen.dart';
import 'package:pharmacio_flutter_mobile/features/auth/presentation/screens/change_password_screen.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/scan_screen.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/screens/inventory_screen.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/screens/inventory_create_screen.dart';
import 'package:pharmacio_flutter_mobile/features/offers/logic/cubits/offers_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/presentation/secreens/proposal_screen.dart';
import 'package:pharmacio_flutter_mobile/features/Proposal/presentation/secreens/proposal_detail_screen.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/cubits/sales_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/presentation/screens/sale_screen.dart';

import 'routes.dart';

import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/main_navigation_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>(),
            child: const LoginPage(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
        );

      case Routes.scanScreen:
        final tabIndex =
            settings.arguments is int ? settings.arguments as int : 0;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OffersCubit>(
            create: (_) => getIt<OffersCubit>(),
            child: ScanScreen(initialTabIndex: tabIndex),
          ),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>()..getMe(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      case Routes.inventoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<InventoryCubit>(
            create: (_) => getIt<InventoryCubit>()..getInventoryList(),
            child: const InventoryScreen(),
          ),
        );

      case Routes.inventoryCreateScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<InventoryCubit>(
            create: (_) => getIt<InventoryCubit>(),
            child: const InventoryCreateScreen(),
          ),
        );

      case Routes.proposalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProposalsCubit>(
            create: (_) => getIt<ProposalsCubit>()..getProposals(),
            child: const ProposalScreen(),
          ),
        );

      case Routes.proposalDetailScreen:
        final proposalId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ProposalsCubit>(
            create: (_) => getIt<ProposalsCubit>()..getProposalDetail(proposalId),
            child: ProposalDetailScreen(proposalId: proposalId),
          ),
        );

      case Routes.saleScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SalesCubit>(
            create: (_) => getIt<SalesCubit>(),
            child: const SaleScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
