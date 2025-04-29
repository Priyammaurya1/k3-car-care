import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import '../utils/constants.dart';

class TopLocationBar extends StatelessWidget {
  const TopLocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.pagePadding),
      decoration: BoxDecoration(
        color: KColors.cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.cardRadius),
          bottomRight: Radius.circular(Dimensions.cardRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Location and Profile Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Location
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: KColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: Dimensions.smallSpacing),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'location blah blah',
                        style: TextStyle(color: KColors.textTitle, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'blah blah...!!!!',
                        style: TextStyle(
                          fontSize: 12,
                          color: KColors.textDesc,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Profile
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ],
          ),
          // Search Box
          Container(
            margin: const EdgeInsets.only(top: Dimensions.itemSpacing),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.cardRadius),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
