import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/screens/home_page.dart';
import 'package:k3carcare/screens/cart_screen.dart';
import 'package:k3carcare/screens/profile_screen.dart';
import 'package:k3carcare/screens/services_screens.dart';
import 'package:k3carcare/screens/store_screen.dart';
import 'package:k3carcare/utils/colors.dart';

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
                        color: Color.fromARGB(255, 255, 255, 255),
                      )
                      : const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
            ),
          ),
          child: NavigationBar(
            height: 65,
            elevation: 0,
            selectedIndex: controller.selectIndex.value,
            onDestinationSelected:
                (index) => controller.selectIndex.value = index,
            backgroundColor: KColors.primaryBackground,
            indicatorColor: Colors.white.withValues(alpha: 0.1),
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home, color: KColors.white),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.setting_2, color: KColors.white),
                label: 'Services',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.shop, color: KColors.white),
                label: 'Store',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.shopping_bag, color: KColors.white),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.user, color: KColors.white),
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
    const CarWashHomePage(),
    const ServicesScreen(),
    const StoreScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];
}
