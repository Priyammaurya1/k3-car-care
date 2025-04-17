import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';

class MenuOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isFirst;
  final bool isLast;

  const MenuOption({
    super.key,
    required this.title,
    required this.icon,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isFirst) const Divider(height: 1),
        InkWell(
          onTap: () {
            // Handle menu option tap
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: KColors.primary,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: KColors.textTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        if (isLast) const Divider(height: 1),
      ],
    );
  }
}