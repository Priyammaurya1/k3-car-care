import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';

class MenuOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onTap;

  const MenuOption({
    super.key,
    required this.title,
    required this.icon,
    this.isFirst = false,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: KColors.primary.withValues(alpha:0.2),
      highlightColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: isFirst ? BorderSide(color: Colors.grey.shade300) : BorderSide.none,
            bottom: isLast ? BorderSide(color: Colors.grey.shade300) : BorderSide(color: Colors.grey.shade200),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            Icon(icon, color: KColors.primary),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
