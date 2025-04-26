
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/controller/onboardingcontroller.dart';
import 'package:k3carcare/utils/colors.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 18,
      bottom: kBottomNavigationBarHeight,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: KColors.primary,
        ),
        child: Icon(Iconsax.arrow_right_3, color: Colors.white, size: 20,),
      ),
    );
  }
}
