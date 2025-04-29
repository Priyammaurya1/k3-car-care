import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import '../utils/constants.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  
  const CustomDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.itemSpacing),
          child: Text(
            text,
            style: TextStyle(
              color: KColors.textDesc,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}