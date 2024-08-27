import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/icons/so_circular_icon.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class SOBottomAddToCart extends StatelessWidget {
  const SOBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SOSizes.defaultSpace, vertical: SOSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? SOColors.darkerGrey : SOColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SOSizes.cardRadiusLg),
          topRight: Radius.circular(SOSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SOCircularIcon(icon: Iconsax.minus, backgroundColor: SOColors.darkGrey, width: 40, height: 40, color: SOColors.white, onPressed: (){}),
              const SizedBox(width: SOSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: SOSizes.spaceBtwItems),
              SOCircularIcon(icon: Iconsax.add, backgroundColor: SOColors.black, width: 40, height: 40, color: SOColors.white, onPressed: (){}),
            ],
          ),
          ElevatedButton(
              onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(SOSizes.md),
              backgroundColor: SOColors.black,
              side: const BorderSide(color: SOColors.black),
            ),
            child: const Text('Add To Cart'),
          ),
        ],
      ),
    );
  }
}
