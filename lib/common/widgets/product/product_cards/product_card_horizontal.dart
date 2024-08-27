import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/common/widgets/images/rounded_image.dart';
import 'package:style_one/common/widgets/price/product_price_text.dart';
import 'package:style_one/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/so_circular_icon.dart';
import '../../texts/product_title_text.dart';
import '../../texts/so_brand_title_text_with_verified_icon.dart';

class SOProductCardHorizontal extends StatelessWidget {
  const SOProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SOSizes.productImageRadius),
          color: dark ? SOColors.darkerGrey : SOColors.softGrey),
      child: Row(
        children: [

          /// Thumbnail
          SORoundedContainer(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(SOSizes.sm),
            backgroundColor: dark ? SOColors.dark : SOColors.light,
            child: Stack(
              children: [

                // Thumbnail Image
                const SizedBox(width: 120, height: 120, child: SORoundedImage(imageUrl: SOImages.womenIcon, applyImageRadius: true)),

                /// ---- Sale Tag
                Positioned(
                  top: 12,
                  child: SORoundedContainer(
                    radius: SOSizes.sm,
                    backgroundColor: SOColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: SOSizes.sm, vertical: SOSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                  ),
                ),

                /// ---- Favourite Icon btn
                const Positioned(top: 0, right: 0, child: SOCircularIcon(
                    icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          /// Details
           SizedBox(
            width: 188,
            child: Padding(
              padding: const EdgeInsets.only(left: SOSizes.sm, top: SOSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SOProductTitleText(title: 'Comfort Fit Crew Neck T-shirt – Sky Blue', smallSize: true),
                      SizedBox(height: SOSizes.spaceBtwItems / 2),
                      SOBrandTitleWidthVerifiedIcon(title: 'Moose'),
                    ],
                  ),

                  const Spacer(),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const Flexible(child: SOProductPriceText(price: '1200')),


                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: SOColors.dark,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(SOSizes.cardRadiusMd), bottomRight: Radius.circular(SOSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: SOSizes.iconLg * 1.2, height: SOSizes.iconLg * 1.2, child: Center(child: Icon(Iconsax.add, color: SOColors.white))),
                      )
                    ],
                  ),




                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
