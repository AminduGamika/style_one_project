import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/so_circular_icon.dart';

class SOProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SOProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SOCircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: SOSizes.md,
            backgroundColor: SOHelperFunctions.isDarkMode(context)
                ? SOColors.white
                : SOColors.black,
            color: SOHelperFunctions.isDarkMode(context)
                ? SOColors.darkerGrey
                : SOColors.light,
            onPressed: () {}),

        const SizedBox(width: SOSizes.spaceBtwItems),

        Text('2', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: SOSizes.spaceBtwItems),

        SOCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: SOSizes.md,
            backgroundColor: SOColors.primary,
            color: SOColors.white,
            onPressed: () {}),
      ],
    );
  }
}