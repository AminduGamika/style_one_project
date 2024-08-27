import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/so_brand_title_text_with_verified_icon.dart';

class SOCartItem extends StatelessWidget {
  const SOCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// --- Image
        SORoundedImage(
          imageUrl: SOImages.product7,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(SOSizes.sm),
          backgroundColor: SOHelperFunctions.isDarkMode(context) ? SOColors.darkerGrey : SOColors.light,
        ),
        const SizedBox(width: SOSizes.spaceBtwItems),

        /// --- Title, Price, & Sizes
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SOBrandTitleWidthVerifiedIcon(title: 'Moose'),
              const Flexible(child: SOProductTitleText(title: 'Comfort Fit Crew Neck T-shirt – Sky Blue' , maxLines: 1)),

              // - Attribute
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Black ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'M ', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )

      ],
    );
  }
}
