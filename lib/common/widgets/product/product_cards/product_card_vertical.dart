
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/common/widgets/images/rounded_image.dart';
import 'package:style_one/features/shop/screens/product_details/product_detail.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../icons/so_circular_icon.dart';
import '../../price/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/so_brand_title_text_with_verified_icon.dart';

class SOProductCardVertical extends StatelessWidget {
  const SOProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);

    /// Container with side padding, colors, edge, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SOShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SOSizes.productImageRadius),
          color: dark ? SOColors.darkerGrey : SOColors.grey.withOpacity(0.4)),
        child: Column(
            children: [

          /// ----- Thumbnail, Wishlist Btn, Discount Tag
          SORoundedContainer(height: 160,
            padding: const EdgeInsets.all(SOSizes.sm),
            backgroundColor: dark ? SOColors.dark : SOColors.light,
            child: Stack(
              children: [

                /// ---- Thumbnail Image
                //best Image size 4:5 or 3:4
                // 1:1
                const SORoundedImage(imageUrl: SOImages.product6, applyImageRadius: true),

                /// ---- Sale Tag
                Padding(
                  padding: const EdgeInsets.all(SOSizes.sm),
                  child: Positioned(
                    top: 12,
                    child: SORoundedContainer(
                      radius: SOSizes.sm,
                      backgroundColor: SOColors.secondary.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(horizontal: SOSizes.sm, vertical: SOSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                    ),
                  ),
                ),

                /// ---- Favourite Icon btn
                const Positioned(top: 0, right: 0, child: SOCircularIcon(
                      icon: Iconsax.heart5, color: Colors.red,))
              ],
            ),
          ),
          const SizedBox(height: SOSizes.spaceBtwItems / 2),

          /// ----- Details
          const Padding(
            padding: EdgeInsets.only(left: SOSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SOProductTitleText(title: 'Comfort Fit Crew Neck T-shirt – Sky Blue', smallSize: true),
                SizedBox(height: SOSizes.spaceBtwItems / 2),
                SOBrandTitleWidthVerifiedIcon(title: 'Moose'),
              ],
            ),
          ),

          //// ----- Spacer
          // Add Spacer() here to keep the height of each Box same in case 1 or 2 lines of headings
          const Spacer(),

          /// Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// ---- Price
              const Padding(
                padding: EdgeInsets.only(left: SOSizes.sm),
                child: SOProductPriceText(price: '950',),
              ),

              // ---- Add to Cart btn
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
          )
        ]),
      ),
    );
  }
}


