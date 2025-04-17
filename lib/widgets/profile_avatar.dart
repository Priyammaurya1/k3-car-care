import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: screenWidth,
          height: 180,
          decoration: BoxDecoration(
            color: KColors.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200),
            ),
            boxShadow: [
              BoxShadow(
                color: KColors.primary,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: KColors.primaryBackground,
              shape: BoxShape.circle,
              border: Border.all(color: KColors.cardColor, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                'https://via.placeholder.com/100',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade400,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
