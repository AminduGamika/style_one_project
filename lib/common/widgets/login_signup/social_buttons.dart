import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:style_one/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SOSocialButtons extends StatelessWidget {
  const SOSocialButtons({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // -- Google SignIn
        Container(
          decoration: BoxDecoration(border: Border.all(color: SOColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: SOSizes.iconMd,
                height: SOSizes.iconMd,
                image: AssetImage(SOImages.google),
            ),
          ),
        ),
        const SizedBox(width: SOSizes.spaceBtwItems),

        // -- Facebook SignIn
        Container(
          decoration: BoxDecoration(border: Border.all(color: SOColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: SOSizes.iconMd,
                height: SOSizes.iconMd,
                image: AssetImage(SOImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}