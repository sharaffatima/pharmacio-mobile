import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/home_page.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/screens/inventory_screen.dart';
import 'package:pharmacio_flutter_mobile/features/notifications/logic/cubits/notifications_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:pharmacio_flutter_mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/logic/cubits/proposals_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/secreens/proposal_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  MainNavigationScreen({super.key});

  static final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  static final ValueNotifier<int> _unreadCountNotifier = ValueNotifier<int>(0);

  final List<Widget> _pages = [
    const HomePage(),
    const AlertsWrapperScreen(),
    const InventoryWrapperScreen(),
    const ProposalWrapperScreen(),
    const ProfileWrapperScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: MainNavigationScreen._currentIndexNotifier,
        builder: (context, currentIndex, _) => _pages[currentIndex],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: MainNavigationScreen._currentIndexNotifier,
        builder: (context, currentIndex, _) {
          return ValueListenableBuilder<int>(
            valueListenable: MainNavigationScreen._unreadCountNotifier,
            builder: (context, unreadCount, _) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.12),
                      blurRadius: 4,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: (index) {
                    MainNavigationScreen._currentIndexNotifier.value = index;
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.navBackground,
                  selectedItemColor: AppColors.navSelected,
                  unselectedItemColor: AppColors.navUnselected,
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: AppStrings.home,
                    ),
                    BottomNavigationBarItem(
                      icon: _AlertsNavIcon(
                        unreadCount: unreadCount,
                        active: false,
                      ),
                      activeIcon: _AlertsNavIcon(
                        unreadCount: unreadCount,
                        active: true,
                      ),
                      label: AppStrings.alertsTitle,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.inventory_2_outlined),
                      activeIcon: Icon(Icons.inventory_2),
                      label: AppStrings.inventoryTitle,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.insert_drive_file_outlined),
                      activeIcon: Icon(Icons.insert_drive_file),
                      label: AppStrings.proposals,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                      label: AppStrings.profile,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AlertsWrapperScreen extends StatelessWidget {
  const AlertsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (_) => getIt<NotificationsCubit>()..getNotifications(),
      child: BlocListener<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (response, _, __) {
              MainNavigationScreen._unreadCountNotifier.value =
                  response.unreadCount;
            },
            actionError: (_, response, __) {
              MainNavigationScreen._unreadCountNotifier.value =
                  response.unreadCount;
            },
            orElse: () {},
          );
        },
        child: const NotificationsScreen(),
      ),
    );
  }
}

class InventoryWrapperScreen extends StatelessWidget {
  const InventoryWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InventoryCubit>(
      create: (_) => getIt<InventoryCubit>()..getInventoryList(),
      child: const InventoryScreen(),
    );
  }
}

class ProfileWrapperScreen extends StatelessWidget {
  const ProfileWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => getIt<AuthCubit>()..getMe(),
      child: const ProfileScreen(),
    );
  }
}

class _AlertsNavIcon extends StatelessWidget {
  final int unreadCount;
  final bool active;

  const _AlertsNavIcon({required this.unreadCount, required this.active});

  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: unreadCount > 0,
      label: Text(
        unreadCount > 99 ? '99+' : unreadCount.toString(),
        style: const TextStyle(color: AppColors.white),
      ),
      backgroundColor: AppColors.redError,
      child: Icon(
        active ? Icons.notifications : Icons.notifications_none_outlined,
      ),
    );
  }
}

class ProposalWrapperScreen extends StatelessWidget {
  const ProposalWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProposalsCubit>(
      create: (_) => getIt<ProposalsCubit>()
        ..getProposals()
        ..getAvailableOffers(),
      child: const ProposalScreen(),
    );
  }
}
