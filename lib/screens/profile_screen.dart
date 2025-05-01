import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/screens/car_selection.dart';
import 'package:k3carcare/widgets/section_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF212121),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeaderr(title: 'Account Settings'),
                  const SizedBox(height: 16),
                  _buildMenuCard([
                    _buildMenuItem(
                      title: 'My Account',
                      icon: Icons.person_outline,
                      isFirst: true,
                      onTap: () {
                        // Handle My Account tap
                      },
                    ),
                    _buildMenuItem(
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
                    _buildMenuItem(
                      title: 'Settings',
                      icon: Icons.settings_outlined,
                      isLast: true,
                      onTap: () {
                        // Handle Settings tap
                      },
                    ),
                  ]),
                  
                  const SizedBox(height: 24),
                  
                  const SectionHeaderr(title: 'About'),
                  const SizedBox(height: 16),
                  _buildMenuCard([
                    _buildMenuItem(
                      title: 'Terms and Conditions',
                      icon: Icons.description_outlined,
                      isFirst: true,
                      onTap: () {
                        // Handle Terms and Conditions tap
                      },
                    ),
                    _buildMenuItem(
                      title: 'Privacy Policy',
                      icon: Icons.privacy_tip_outlined,
                      onTap: () {
                        // Handle Privacy Policy tap
                      },
                    ),
                    _buildMenuItem(
                      title: 'Help & Support',
                      icon: Icons.help_outline,
                      isLast: true,
                      onTap: () {
                        // Handle Help & Support tap
                      },
                    ),
                  ]),
                  
                  const SizedBox(height: 24),
                  
                  _buildLogoutButton(context),
                  
                  const SizedBox(height: 70),
                  
                  _buildCompanyFooter(),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFE53935),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/pfp.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF757575),
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '+91 98765 43210',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF757575),
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  
  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
  
  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    bool isFirst = false,
    bool isLast = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: !isLast
              ? const Border(
                  bottom: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1,
                  ),
                )
              : null,
          borderRadius: BorderRadius.vertical(
            top: isFirst ? const Radius.circular(12) : Radius.zero,
            bottom: isLast ? const Radius.circular(12) : Radius.zero,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: const Color(0xFFE53935),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF212121),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF9E9E9E),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE53935),
            Color(0xFFC62828),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE53935).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle logout
          },
          borderRadius: BorderRadius.circular(12),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  
  Widget _buildCompanyFooter() {
    return Center(
      
      child: Column(
        
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          const SizedBox(height: 10),
          const Text(
            "Created for you with ❤",
            style: TextStyle(
              color: Color(0xFF9E9E9E),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "v1.0.0",
            style: TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}