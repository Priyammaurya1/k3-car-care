import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';

class KStyles {
  // Text styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: KColors.textTitle,
    height: 1.2,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: KColors.textTitle,
    height: 1.2,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: KColors.textTitle,
    height: 1.2,
  );
  
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: KColors.textTitle,
    height: 1.2,
  );
  
  static const TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: KColors.textTitle,
    height: 1.2,
  );
  
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    color: KColors.textDesc,
    height: 1.5,
  );
  
  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    color: KColors.textDesc,
    height: 1.5,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: KColors.textLight,
    height: 1.2,
  );
  
  // Button styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: KColors.primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 0,
  );
  
  static final ButtonStyle outlinedButton = OutlinedButton.styleFrom(
    foregroundColor: KColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    side: const BorderSide(color: KColors.primary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
  
  static final ButtonStyle textButton = TextButton.styleFrom(
    foregroundColor: KColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  
  // Card styles
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: KColors.cardColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
  
  static final BoxDecoration smallCardDecoration = BoxDecoration(
    color: KColors.cardColor,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.04),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  // Input decoration
  static InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: KColors.cardColor,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: KColors.primary, width: 1),
      ),
    );
  }
}