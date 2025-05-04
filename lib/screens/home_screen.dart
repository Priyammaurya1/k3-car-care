import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k3carcare/model/horizontal_scroll.dart';
import 'package:k3carcare/screens/car_detailing_screen.dart';
import 'package:k3carcare/screens/periodic_service_screen.dart';
import 'package:k3carcare/screens/store_screen.dart';
import 'package:k3carcare/widgets/appointment_card.dart';
import 'package:k3carcare/widgets/banner_slider.dart';
import 'package:k3carcare/widgets/section_header.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildAppointmentSection(),
              SizedBox(height: 5),
              _buildBannerSection(),
              _buildServicesSection(context),
              _buildStoreSection(),
              _buildWarrantySection(context),
              const SizedBox(height: 40),
              Center(
                child: _buildCompanyFooter(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFE53935),
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Tarna',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Color(0xFF212121),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Shivpur, Varanasi - 221003",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Poppins",
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
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
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEEEEEE)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Color(0xFF9E9E9E), size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for services or products',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFFBDBDBD),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Your Appointment'),
          const SizedBox(height: 12),
          const AppointmentCard(date: "Today", time: "2:00 pm"),
        ],
      ),
    );
  }

  Widget _buildBannerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SectionHeader(title: 'Special Offers'),
        ),
        const SizedBox(height: 12),
        BannerSlider(
          height: 180.0,
          assetPaths: [
            'assets/images/banner/banner-1.png',
            'assets/images/banner/banner-2.png',
            'assets/images/banner/banner-3.png',
            'assets/images/banner/banner-4.png',
          ],
          autoScrollDuration: const Duration(seconds: 3),
        ),
      ],
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Our Services'),
          const SizedBox(height: 16),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _buildServiceCard(
                rightPadding: false,
                title: "Periodic\nServices",
                iconPath: 'assets/images/service.png',
                 colors: const [
                  Color(0xFFFF7043),
                  Color(0xFFFF5722),
                ],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const PeriodicServicesScreen()));
                },
              ),
              _buildServiceCard(
                rightPadding: false,
                title: "Car\nDetailing",
                iconPath: 'assets/images/wash.png',
                colors: const [
                  Color(0xFF26C6DA),
                  Color(0xFF00ACC1),
                ],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const CarDetailingScreen()));
                },
              ),
              _buildServiceCard(
                rightPadding: false,
                title: "Car\nBatteries",
                iconPath: 'assets/images/battery.png',
                colors: const [
                  Color(0xFF66BB6A),
                  Color(0xFF4CAF50),
                ],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const StoreScreen()));
                },
              ),
              _buildServiceCard(
                rightPadding: true,
                title: "K3 Gold\nPlan",
                iconPath: 'assets/images/car-wash.png',
                colors: const [
                  Color(0xFFEF5350),
                  Color(0xFFE53935),
                ],
                onTap: () {
                  // dance nigga you got no game
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String iconPath,
    required List<Color> colors,
    required VoidCallback onTap,
    required bool rightPadding,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: rightPadding? 0:16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          boxShadow: [
            BoxShadow(
              color: colors[0].withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                height: 1.2,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                iconPath,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const SectionHeader(title: 'Store'),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFE53935),
                ),
                child: const Text(
                  'See More',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        HorizontalServicesList(),
      ],
    );
  }

  Widget _buildWarrantySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Original Spare Parts'),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Extended Warranty with K3 Car Care",
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildBrandLogo('assets/images/brands/bosch.svg', 40, 100, isSvg: true),
                      _buildBrandLogo('assets/images/brands/mahle.svg', 19, 100, isSvg: true),
                      _buildBrandLogo('assets/images/brands/ntn.png', 25, 100, isSvg: false),
                      _buildBrandLogo('assets/images/brands/textar.png', 40, 100, isSvg: false),
                      _buildBrandLogo('assets/images/brands/valeo.svg', 35, 100, isSvg: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandLogo(String path, double height, double width, {required bool isSvg}) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: height,
      width: width,
      child: isSvg
          ? SvgPicture.asset(path)
          : Image.asset(path, fit: BoxFit.contain),
    );
  }
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
