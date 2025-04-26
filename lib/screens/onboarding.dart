import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k3carcare/controller/onboardingcontroller.dart';
import 'package:k3carcare/text/ktexts.dart';
import 'package:k3carcare/widgets/onboarding_dot_position.dart';
import 'package:k3carcare/widgets/onboarding_page.dart';
import 'package:k3carcare/widgets/onboarding_skip.dart';
import 'package:k3carcare/widgets/onboarding_skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: 'assets/images/onboard/onBoarding_1.png',
                title: KTexts.onBoardingTitle1,
                subTitle: KTexts.onBoardingSubTitle1,
              ),
               OnBoardingPage(
                image: 'assets/images/onboard/onBoarding_2.png',
                title: KTexts.onBoardingTitle2,
                subTitle: KTexts.onBoardingSubTitle2,
              ),
               OnBoardingPage(
                image: 'assets/images/onboard/onBoarding_3.png',
                title: KTexts.onBoardingTitle3,
                subTitle: KTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot navigation SmoothPageIndication
          const OnBoardingDotPosition(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

