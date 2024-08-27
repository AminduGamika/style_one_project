import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/success_screen/success_screen.dart';
import 'package:style_one/data/repositories/authentication/authentication_repository.dart';
import 'package:style_one/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:style_one/features/authentication/screens/login/login.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      // The close icon in the app bar is used to log out the user and redirect them to the login screen
      // The approach is taken to handle scenarios where the user enters the registration process.
      // and the date is stored. Upon reopening the app, it check if the email is verified.
      // If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to give Default Equal Space On all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(SOImages.deliveredEmailIllustration),
                width: SOHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SOSizes.spaceBtwSections),

              ///Title & Subtitle
              Text(SOTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SOSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: SOSizes.spaceBtwItems),
              Text(SOTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationsStatus(),
                      child: const Text(SOTexts.sOContinue)),
              ),
              const SizedBox(height: SOSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(SOTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
