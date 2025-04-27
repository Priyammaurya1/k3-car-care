import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import '../models/service_model2.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = ServiceModel2.getSampleServices();

    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: KColors.white),
        backgroundColor: KColors.primaryBackground,
        elevation: 0,
        title: const Text(
          'Services',
          style: TextStyle(
            color: KColors.textTitle,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: ListView.builder(
            
            itemCount: services.length,
            itemBuilder: (context, index) {
              return ServiceCard(
                
                service: services[index],
                onBookPressed: () {},
              );
            },
          ),
        ),
        ),
      ),
    );
  }
}
