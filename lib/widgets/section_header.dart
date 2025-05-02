import 'package:flutter/material.dart';
import 'package:k3carcare/utils/styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onActionPressed;
  final String actionText;
  final bool viewMore;
  final bool topPadding;
  final TextStyle? titleStyle;

  const SectionHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.onActionPressed,
    this.actionText = '',
    this.viewMore = false,
    this.topPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: topPadding ? const EdgeInsets.only(bottom: 16.0, top: 8.0) : const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              titleStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
                fontFamily: 'Poppins',
              ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 32,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFFE53935),
            borderRadius: BorderRadius.circular(2),
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