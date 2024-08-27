import 'package:flutter/material.dart';

import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SOBillingPaymentSection extends StatelessWidget {
  const SOBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SOSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),
        Row(
          children: [
            SORoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? SOColors.light : SOColors.white,
              padding: const EdgeInsets.all(SOSizes.sm),
              child: const Image(image: AssetImage(SOImages.visa), fit: BoxFit.contain),
            ),
            const SizedBox(width: SOSizes.spaceBtwItems / 2),
            Text('Visa', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),
      ],
    );
  }
}
