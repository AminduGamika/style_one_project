import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class SOTermsAndConditionsCheckbox extends StatelessWidget {
  const SOTermsAndConditionsCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SOHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24,
            height: 24,
            child: Obx(
                  () => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
            ),
        ),
        const SizedBox(width: SOSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: '${SOTexts.iAgreeTo} ', style: Theme
                .of(context)
                .textTheme
                .bodySmall),
            TextSpan(text: SOTexts.privacyPolicy, style: Theme
                .of(context)
                .textTheme
                .bodyMedium!
                .apply(
              color: dark ? SOColors.white : SOColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? SOColors.white : SOColors.primary,
            )),
            TextSpan(text: ' ${SOTexts.and} ', style: Theme
                .of(context)
                .textTheme
                .bodySmall),
            TextSpan(text: SOTexts.termsOfUse, style: Theme
                .of(context)
                .textTheme
                .bodyMedium!
                .apply(
              color: dark ? SOColors.white : SOColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? SOColors.white : SOColors.primary,
            )),
          ]),
        ),
      ],
    );
  }
}