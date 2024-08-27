import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/login_signup/form_divider.dart';
import 'package:style_one/common/widgets/login_signup/social_buttons.dart';
import 'package:style_one/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(SOTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// Form
              const SOSignupForm(),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// Divider
               SOFormDivider(dividerText: SOTexts.orSignUpWith.capitalize!),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// Social Icons
              const SOSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}


