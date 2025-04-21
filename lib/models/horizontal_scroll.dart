import 'package:flutter/material.dart';

class HorizontalServicesList extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {'name': 'Oil Change', 'icon': Icons.oil_barrel},
    {'name': 'Car Wash', 'icon': Icons.local_car_wash},
    {'name': 'Battery Check', 'icon': Icons.battery_charging_full},
    {'name': 'AC Service', 'icon': Icons.ac_unit},
    {'name': 'Tyre Replacement', 'icon': Icons.build_circle},
  ];

  HorizontalServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Adjust height according to your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Container(
                width: 280,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(service['icon'], size: 30),
                    const SizedBox(height: 10),
                    Text(
                      service['name'],
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
