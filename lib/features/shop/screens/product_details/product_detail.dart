import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/features/shop/screens/product_details/widgets/product_add_to_cart.dart';
import 'package:style_one/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:style_one/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:style_one/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:style_one/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:style_one/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SOBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---- Product Image Slider
            const SOProductImageSlider(),

            /// ---- Product Details
            Padding(
              padding: const EdgeInsets.only(right: SOSizes.defaultSpace, left: SOSizes.defaultSpace, bottom: SOSizes.defaultSpace),
              child: Column(
                children: [
                  ///  -  Rating & Share
                  const SORatingAndShare(),

                  ///  -  Price, Title, Stock, & Brand
                  const SOProductMetaData(),
                  const SizedBox(height: SOSizes.spaceBtwItems / 2),

                  ///  -  Attributes
                  const SOProductAttributes(),
                  const SizedBox(height: SOSizes.spaceBtwSections),

                  ///  -  Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){} , child: const Text('CheckOut'))),
                  const SizedBox(height: SOSizes.spaceBtwSections),

                  ///  -  Description
                  const SOSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: SOSizes.spaceBtwItems),
                  const ReadMoreText(
                            'Moose Crew Neck T-shirts are out, a wide variety of your favourite colors to choose from for all your casual needs! Moose Crew Neck '
                            'T-shirts are out, a wide variety of your favourite colors to choose from for all your casual needs\n'
                            '\n'
                            'About the fabric\n'
                            '\n'
                            'Fabric composition : Polyester mixed cotton\n'
                            'Fabric pattern : Solid / Print\n'
                            'Fit type : Comfort Fit\n'
                            'Length : Regular\n'
                            '\n'
                            'Add-on Feature\n'
                            '\n'
                            'Comfortable\n'
                            'Great fit on\n'
                            'Authentic branding\n'
                            'Care instructions on the satin care label for machine wash directions\n'
                            'Comfortable heat seals\n'
                            '\n'
                            'Fabric Care\n'
                            'Machine wash\n'
                            '\n'
                            'Note\n'
                            '\n'
                            'The item may slightly vary from the displayed image in terms of color due to lighting conditions or the display used'
                            'to view, and the fabric material from color to color and size to size.'
                    ,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more... ',
                    trimExpandedText: '   Show Less... ',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: SOColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: SOColors.primary),
                  ),


                  ///  -  Reviews
                  const Divider(),
                  const SizedBox(height: SOSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SOSectionHeading(title: 'Reviews (78)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3), iconSize: 18),
                    ],
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}




