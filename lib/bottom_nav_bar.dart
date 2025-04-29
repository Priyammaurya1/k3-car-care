import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/screens/cart_screen.dart';
import 'package:k3carcare/screens/home_screen.dart';
import 'package:k3carcare/screens/profile_screen.dart';
import 'package:k3carcare/screens/services_screens.dart';
import 'package:k3carcare/screens/store_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) =>
                  states.contains(WidgetState.selected)
                      ? const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                      : const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
            ),
          ),
          child: NavigationBar(
            height: 65,
            elevation: 0,
            selectedIndex: controller.selectIndex.value,
            onDestinationSelected:
                (index) => controller.selectIndex.value = index,
            backgroundColor: const Color(0xFFF8F9FA),
            indicatorColor: const Color.fromARGB(255, 124, 115, 115).withValues(alpha: 0.1),
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home, color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.setting_2, color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Services',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.shop, color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Store',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.shopping_bag, color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.user, color: Color.fromARGB(255, 0, 0, 0)),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectIndex = 0.obs;

  final screens = [
    const HomeScreenNew(),
    const ServicesScreen(),
    const StoreScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];
}
