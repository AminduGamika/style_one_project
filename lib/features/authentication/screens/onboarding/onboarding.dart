import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:style_one/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:style_one/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:style_one/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:style_one/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/text_string.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
      /// Horizontal Scrollable pages
      PageView(
      controller: controller.pageController,
      onPageChanged: controller.updatePageIndicator,
      children: const [
      OnBoardingPage(
      image: SOImages.onBoardingImage1,
        title: SOTexts.onBoardingTitle1,
        subTitle: SOTexts.onBoardingSubTitle1,
      ),
      OnBoardingPage(
        image: SOImages.onBoardingImage2,
        title: SOTexts.onBoardingTitle2,
        subTitle: SOTexts.onBoardingSubTitle2,
      ),
      OnBoardingPage(
        image: SOImages.onBoardingImage3,
        title: SOTexts.onBoardingTitle3,
        subTitle: SOTexts.onBoardingSubTitle3,
      ),
      ],
    ),

    /// Skip Button
    const OnBoardingSkip(),

    /// Dot Navigation SmoothPageIndicator
    const OnBoardingDotNavigation(),

    /// Circular Button
     const OnboardingNextButton()
    ],
    ),
    );
  }
}






