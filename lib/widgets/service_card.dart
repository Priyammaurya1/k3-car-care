// lib/widgets/service_card.dart

import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import '../models/service_model2.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel2 service;
  final Function() onBookPressed;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Image section
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                service.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.local_car_wash, size: 40, color: Colors.grey.shade400);
                },
              ),
            ),
            const SizedBox(width: 16),
            
            // Content section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: const TextStyle(color: KColors.textTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: KColors.textDesc,
                    ),
                  ),
                ],
              ),
            ),
            
            // Book button
            ElevatedButton(
              onPressed: onBookPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}