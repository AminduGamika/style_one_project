import 'package:flutter/material.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

class SOLoginHeader extends StatelessWidget {
  const SOLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage( dark ? SOImages.darkAppLogo : SOImages.lightAppLogo),
        ),
        Text(SOTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: SOSizes.sm),
        Text(SOTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
