import 'package:flutter/material.dart';

class KColors {
  // Primary colors
  static const Color primary = Colors.redAccent;
  static const Color primaryDark = Color.fromARGB(255, 196, 13, 0);
  static const Color primaryLight = Color.fromARGB(255, 243, 94, 84);
  
  // Background colors
  static const Color primaryBackground = Color(0xFFF8F9FA);
  static const Color cardColor = Colors.white;
  static const Color scaffoldBackground = Color(0xFFF8F9FA);
  
  // Text colors
  static const Color textTitle = Color(0xFF212121);
  static const Color textDesc = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBD);
  
  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Colors.redAccent;
  
  // Misc
  static const Color divider = Color(0xFFEEEEEE);
  static const Color shadow = Color(0x1A000000);
  
  // Function to get color with opacity
  static Color withOpacity(Color color, double opacity) {
    // ignore: deprecated_member_use
    return color.withOpacity(opacity);
  }
}