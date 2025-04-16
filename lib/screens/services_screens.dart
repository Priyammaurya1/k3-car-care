// lib/screens/services_screen.dart

import 'package:flutter/material.dart';
import '../models/service_model2.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = ServiceModel2.getSampleServices();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Services',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              return ServiceCard(
                service: services[index],
                onBookPressed: () {
                  // _bookService(context, services[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }

//   void _bookService(BuildContext context, ServiceModel2 service) {
//     // Show a snackbar for demonstration purposes
//     // In a real app, this would navigate to a booking screen or show a booking dialog
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Booking ${service.title} - \$${service.price.toStringAsFixed(2)}'),
//         action: SnackBarAction(
//           label: 'OK',
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
}