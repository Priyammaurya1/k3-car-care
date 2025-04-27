import 'package:flutter/material.dart';
import 'package:k3carcare/screens/booking_screen.dart';
import 'package:k3carcare/utils/colors.dart';
import '../utils/constants.dart';

class AppointmentCard extends StatelessWidget {
  final String date;
  final String time;

  const AppointmentCard({super.key, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 190,
      padding: const EdgeInsets.all(Dimensions.pagePadding),
      decoration: BoxDecoration(
        color: KColors.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.cardRadius),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your car's appointment is",
                style: TextStyle(fontSize: 14, color: KColors.textTitle),
              ),
              const SizedBox(height: Dimensions.tinySpacing),
              Text(
                "$date at, $time",
                style: TextStyle(
                  color: KColors.textTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 18),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => const ServiceBookingScreen(
                        buttonText: "Reschedule",
                        title: "Reschdule Your Booking",
                      ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: KColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 2,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              // minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Reschedule',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
