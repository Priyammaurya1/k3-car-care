import 'package:flutter/material.dart';

class HorizontalServicesList extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {'title': 'Exterior', 'desc': 'Buy Top Trending\nExterior Products.' , 'image': 'assets/images/wheel.png'},
    {'title': 'Interior', 'desc': 'Buy Top Trending\nInterior Products.' , 'image': 'assets/images/asse.png'},
    {'title': 'Bike Kit', 'desc': 'Buy Top Trending\nBike Kits.' , 'image': 'assets/images/bike-kit.png'},
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
          return Card(
            // color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            
            // elevation: 3,
            
            child: Container(
              width: 240,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(service['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        service['desc'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 105, 105, 105)),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image(image: Image.asset(service['image'] as String).image),
                ],
                
              ),
            ),
          );
        },
      ),
    );
  }
}
