import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/home_page.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/screens/inventory_screen.dart';
import 'package:pharmacio_flutter_mobile/features/profile/presentation/screens/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Scaffold(body: Center(child: Text("Alerts Screen"))),
    const InventoryWrapperScreen(),
    const Scaffold(body: Center(child: Text("Proposals Screen"))),
    const ProfileWrapperScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff2962ff), // A blue color resembling the image
          unselectedItemColor: const Color(0xff607d8b), // A greyish blue
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: const Text('3', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xfff44336), // red
                child: const Icon(Icons.notifications_none_outlined),
              ),
              activeIcon: Badge(
                label: const Text('3', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xfff44336), 
                child: const Icon(Icons.notifications),
              ),
              label: 'Alerts',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2),
              label: 'Inventory',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file_outlined),
              activeIcon: Icon(Icons.insert_drive_file),
              label: 'Proposals',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
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
