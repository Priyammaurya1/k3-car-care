import 'package:flutter/material.dart';
import 'package:k3carcare/widgets/company_footer.dart';
import 'package:k3carcare/widgets/menu_options.dart';
import 'package:k3carcare/widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const MenuOption(
                      title: 'My Account',
                      icon: Icons.person_outline,
                      isFirst: true,
                    ),
                    const MenuOption(
                      title: 'Settings',
                      icon: Icons.settings_outlined,
                    ),
                    const MenuOption(
                      title: 'Terms and Conditions',
                      icon: Icons.description_outlined,
                    ),
                    const MenuOption(
                      title: 'Log Out',
                      icon: Icons.logout_outlined,
                      isLast: true,
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
      ),
    );
  }
}