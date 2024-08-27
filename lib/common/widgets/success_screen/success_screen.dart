import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:style_one/common/styles/spacing.style.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SOSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(height: SOSizes.spaceBtwSections),

              ///Title & Subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SOSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(SOTexts.sOContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
