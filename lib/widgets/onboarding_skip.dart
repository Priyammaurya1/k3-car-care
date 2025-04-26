import 'package:flutter/material.dart';
import 'package:k3carcare/controller/onboardingcontroller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: 16,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip', style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
