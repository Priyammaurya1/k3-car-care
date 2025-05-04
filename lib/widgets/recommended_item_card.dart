import 'package:flutter/material.dart';
import 'package:k3carcare/models/recommended_item.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/utils/styles.dart';

class RecommendedItemCard extends StatelessWidget {
  final RecommendedItem item;
  final VoidCallback onAdd;
  
  const RecommendedItemCard({
    super.key,
    required this.item,
    required this.onAdd,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: KStyles.smallCardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Item image
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: KColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildItemImage(),
            ),
            const SizedBox(width: 16),
            
            // Item details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: KStyles.subtitle1),
                  const SizedBox(height: 4),
                  if (item.isService) _buildDuration(),
                ],
              ),
            ),
            
            // Price and add button
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₹${item.price.toStringAsFixed(0)}",
                  style: KStyles.subtitle1,
                ),
                const SizedBox(height: 8),
                _buildAddButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    // Check if the imageUrl is a network image or an asset
    if (item.imageUrl.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackIcon();
          },
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          item.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackIcon();
          },
        ),
      );
    }
  }

  Widget _buildFallbackIcon() {
    return Center(
      child: Icon(
        item.isService ? Icons.cleaning_services : Icons.local_car_wash,
        size: 30,
        color: KColors.primary,
      ),
    );
  }

  Widget _buildDuration() {
    return Row(
      children: [
        Icon(
          Icons.timer_outlined,
          size: 14,
          color: KColors.textDesc.withValues(alpha: 0.7),
        ),
        const SizedBox(width: 4),
        Text(
          item.duration,
          style: TextStyle(
            fontSize: 13,
            color: KColors.textDesc.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return Material(
      color: KColors.primary,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onAdd,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(width: 4),
              Text(
                "Add",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}