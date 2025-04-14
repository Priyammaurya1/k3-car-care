import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../utils/constants.dart';

class ServiceList extends StatelessWidget {
  final List<ServiceModel> services;
  final Function(int)? onBuyPressed;
  
  const ServiceList({
    super.key,
    required this.services,
    this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Dimensions.pagePadding, left: Dimensions.pagePadding, right: Dimensions.pagePadding),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Dimensions.cardRadius),
          topRight: Radius.circular(Dimensions.cardRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(Dimensions.pagePadding),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: List.generate(
                  services.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: index != services.length - 1 ? Dimensions.itemSpacing : 0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: index != services.length - 1
                            ? Border(
                                bottom: BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              )
                            : null,
                      ),
                      padding: EdgeInsets.only(
                        bottom: index != services.length - 1 ? Dimensions.itemSpacing : 0,
                      ),
                      child: Row(
                        children: [
                          // Service Image
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                services[index].image,
                                style: TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Service Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  services[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: Dimensions.tinySpacing),
                                Text(
                                  services[index].description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Buy Button
                          ElevatedButton(
                            onPressed: () {
                              if (onBuyPressed != null) {
                                onBuyPressed!(services[index].id);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 2,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}