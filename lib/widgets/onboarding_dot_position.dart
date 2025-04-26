
import 'package:flutter/material.dart';
import 'package:k3carcare/controller/onboardingcontroller.dart';
import 'package:k3carcare/utils/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotPosition extends StatelessWidget {
  const OnBoardingDotPosition({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  OnBoardingController.instance;
    final dark = MpHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: 16,

      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? Colors.white : Colors.black,
          dotHeight: 6,
        ),
      ),
    );
  }
}
