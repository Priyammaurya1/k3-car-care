import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/utils/styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onActionPressed;
  final String actionText;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onActionPressed,
    this.actionText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: KStyles.heading3),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: KColors.textDesc.withOpacity(0.8),
                ),
              ),
            ],
          ),
          if (actionText.isNotEmpty && onActionPressed != null)
            TextButton(
              onPressed: onActionPressed,
              style: KStyles.textButton,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    actionText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward, size: 14),
                ],
              ),
            ),
        ],
      ),
    );
  }
}