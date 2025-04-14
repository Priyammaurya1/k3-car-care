import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../utils/constants.dart';
import '../widgets/top_location_bar.dart';
import '../widgets/appointment_card.dart';
import '../widgets/services_divider.dart';
import '../widgets/banner_slider.dart';
import '../widgets/service_list.dart';

class CarWashHomePage extends StatefulWidget {
  const CarWashHomePage({super.key});

  @override
  State<CarWashHomePage> createState() => _CarWashHomePageState();
}

class _CarWashHomePageState extends State<CarWashHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onBuyPressed(int serviceId) {
    // Implement your buy functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Buying service ID: $serviceId')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Container with Location and Profile
            const TopLocationBar(),
            
            // Main Content - Scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Dimensions.pagePadding),
                child: Column(
                  children: [
                    // Upcoming Appointment Box
                    const AppointmentCard(date: "Today", time: "2:35 pm"),
                    
                    const SizedBox(height: Dimensions.elementSpacing),
                    
                    // Services Divider
                    const ServicesDivider(),
                    
                    const SizedBox(height: Dimensions.elementSpacing),
                    
                    // Banner Slider
                    const BannerSlider(),
                    
                    const SizedBox(height: Dimensions.elementSpacing),
                    
                    // Service List
                    ServiceList(
                      services: sampleServices,
                      onBuyPressed: _onBuyPressed,
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                border: Border(
                  top: BorderSide(color: AppColors.borderColor),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                ],
                selectedItemColor: AppColors.primary,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}