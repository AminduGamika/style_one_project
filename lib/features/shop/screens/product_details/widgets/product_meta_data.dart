import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/images/so_circular_image.dart';
import 'package:style_one/common/widgets/price/product_price_text.dart';
import 'package:style_one/common/widgets/texts/product_title_text.dart';
import 'package:style_one/common/widgets/texts/so_brand_title_text_with_verified_icon.dart';
import 'package:style_one/utils/constants/enums.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SOProductMetaData extends StatelessWidget {
  const SOProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //// Price & Sale Price
        Row(
          children: [
            // --- Sale Tag
            SORoundedContainer(
              radius: SOSizes.sm,
              backgroundColor: SOColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: SOSizes.sm, vertical: SOSizes.xs),
              child: Text('-5%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
            ),
            const SizedBox(width: SOSizes.spaceBtwItems),

            // --- Price
            Text('LKR.1000', style: Theme.of(context).textTheme.titleLarge!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: SOSizes.spaceBtwItems),
            const SOProductPriceText(price: '950', isLarge: true),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 1.5),

        //// Title
        const SOProductTitleText(title: 'Comfort Fit Crew Neck T-shirt – Sky Blue'),
        const SizedBox(height: SOSizes.spaceBtwItems / 1.5),

        //// Stock Status
        Row(
          children: [
            const SOProductTitleText(title: 'Stock'),
            const SizedBox(width: SOSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 1.5),

        //// Brand
        Row(
          children: [
            SOCircularImage(image: SOImages.moose, width: 32, height: 32, overlayColor: dark ? SOColors.white : SOColors.black),
            const SizedBox(width: SOSizes.spaceBtwItems / 2),
            const SOBrandTitleWidthVerifiedIcon(title: 'Moose', brandTextSize: TextSizes.medium),
          ],
        ),

      ],
    );
  }
}
