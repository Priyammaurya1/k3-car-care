import 'package:flutter/material.dart';
import 'package:k3carcare/models/cart_item.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/utils/styles.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final bool showDivider;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onRemove,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Item image
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: KColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
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
                    Text(
                      item.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: KColors.textDesc.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Price and remove button
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "₹${item.price.toStringAsFixed(0)}",
                    style: KStyles.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  _buildRemoveButton(),
                ],
              ),
            ],
          ),
        ),
        if (showDivider) _buildDivider(),
      ],
    );
  }

  Widget _buildItemImage() {
    // Check if the imageUrl is a network image or an asset
    if (item.imageUrl.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
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
        borderRadius: BorderRadius.circular(12),
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
        Icons.local_car_wash,
        size: 34,
        color: KColors.primary,
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onRemove,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: KColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete_outline,
                size: 16,
                color: KColors.primary,
              ),
              const SizedBox(width: 4),
              Text(
                "Remove",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: KColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: KColors.divider,
      height: 1,
      thickness: 1,
    );
  }
}