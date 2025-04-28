import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/screens/car_selection.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/widgets/company_footer.dart';
import 'package:k3carcare/widgets/menu_options.dart';
import 'package:k3carcare/widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      body: Column(
        children: [
          const ProfileAvatar(),
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  MenuOption(
                    title: 'My Account',
                    icon: Icons.person_outline,
                    isFirst: true,
                    onTap: () {
                      // Handle My Account tap
                    },
                  ),
                  MenuOption(
                    title: 'My Car',
                    icon: Iconsax.car,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BrandSelectionScreen(),
                        ),
                      );
                    },
                  ),
                  MenuOption(
                    title: 'Settings',
                    icon: Icons.settings_outlined,
                    onTap: () {
                      // Handle Settings tap
                    },
                  ),
                  MenuOption(
                    title: 'Terms and Conditions',
                    icon: Icons.description_outlined,
                    onTap: () {
                      // Handle Terms and Conditions tap
                    },
                  ),
                  MenuOption(
                    title: 'Log Out',
                    icon: Icons.logout_outlined,
                    isLast: true,
                    onTap: () {
                      // Handle Log Out tap
                    },
                  ),
                  const Spacer(),
                  const CompanyFooter(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
