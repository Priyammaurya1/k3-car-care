import 'package:flutter/material.dart';

class SectionHeaderr extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  
  const SectionHeaderr({
    super.key,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? const TextStyle(
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
    );
  }
}