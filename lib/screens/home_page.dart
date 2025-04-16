import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import '../models/service_model.dart';
import '../utils/constants.dart';
import '../widgets/top_location_bar.dart';
import '../widgets/appointment_card.dart';
import '../widgets/services_divider.dart';
import '../widgets/banner_slider.dart';
import '../widgets/service_list.dart';

class CarWashHomePage extends StatelessWidget {
  const CarWashHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              ///--- Header ---///
              const TopLocationBar(),
              const SizedBox(height: 18),

              Padding(
                padding: const EdgeInsets.all(Dimensions.pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///--- Appointment Card ---///
                    const AppointmentCard(date: "Today", time: "2:35 pm"),
                    const SizedBox(height: Dimensions.elementSpacing),

                    ///--- Services Divider ---///
                    const ServicesDivider(),
                    const SizedBox(height: Dimensions.elementSpacing),

                    ///--- Banners ---///
                    const BannerSlider(),
                    // const SizedBox(height: 2),
                  ],
                ),
              ),

              ///--- Services ---///
              ServiceList(services: sampleServices),
            ],
          ),
        ),
      ),
    );
  }
}
