import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/screens/home_page.dart';
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
        (Set<WidgetState> states) => states.contains(WidgetState.selected)
            ? const TextStyle(color: Color.fromARGB(255, 255, 255, 255))
            : const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      )),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectIndex.value,
            onDestinationSelected:
                (index) => controller.selectIndex.value = index,
            backgroundColor: KColors.black,
            indicatorColor: Colors.white.withValues(alpha: 0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home, color: KColors.white,), label: 'Home'),
              NavigationDestination(
                icon: Icon(Iconsax.setting_2, color: KColors.white,),
                label: 'Services',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.card, color: KColors.white,),
                label: 'Payments',
              ),
              NavigationDestination(icon: Icon(Iconsax.user, color: KColors.white,), label: 'Profile' ),
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
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
  ];
}
