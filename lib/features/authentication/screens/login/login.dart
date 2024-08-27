import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/styles/spacing.style.dart';
import 'package:style_one/features/authentication/screens/login/widgets/login_form.dart';
import 'package:style_one/features/authentication/screens/login/widgets/login_header.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/constants/text_string.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SOSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo, Title & Sub-Title
              const SOLoginHeader(),

              // Form
              const SOLoginForm(),

              /// Divider
              SOFormDivider(dividerText: SOTexts.orSignInWith.capitalize!),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// Footer
              const SOSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}







