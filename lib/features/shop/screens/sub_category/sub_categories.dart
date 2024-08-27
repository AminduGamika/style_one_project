import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/common/widgets/images/rounded_image.dart';
import 'package:style_one/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SOAppBar(title: Text('Girls Ware'), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SOSizes.defaultSpace),
        child: Column(
          children: [

            /// --- Banner
            const SORoundedImage(width: double.infinity, applyImageRadius:true, imageUrl: SOImages.promoBanner1),
            const SizedBox(height: SOSizes.spaceBtwSections),

            /// --- Sub Categories

            Column(
              children: [
                // - Heading
                SOSectionHeading(title: 'Girls T-Shirts', onPressed: (){}),
                const SizedBox(height: SOSizes.spaceBtwItems / 2),

                // - Product Card
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SOSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SOProductCardHorizontal()),
                ),

              ],
            ),
            const SizedBox(height: SOSizes.spaceBtwSections),

            Column(
              children: [
                // - Heading
                SOSectionHeading(title: 'Girls Blouses', onPressed: (){}),
                const SizedBox(height: SOSizes.spaceBtwItems / 2),

                // - Product Card
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SOSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SOProductCardHorizontal()),
                ),

              ],
            ),
            const SizedBox(height: SOSizes.spaceBtwSections),

            Column(
              children: [
                // - Heading
                SOSectionHeading(title: 'Girls Skirts', onPressed: (){}),
                const SizedBox(height: SOSizes.spaceBtwItems / 2),

                // - Product Card
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SOSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SOProductCardHorizontal()),
                ),

              ],
            ),
            const SizedBox(height: SOSizes.spaceBtwSections),

            Column(
              children: [
                // - Heading
                SOSectionHeading(title: 'Girls Frocks', onPressed: (){}),
                const SizedBox(height: SOSizes.spaceBtwItems / 2),

                // - Product Card
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SOSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SOProductCardHorizontal()),
                ),

              ],
            ),

          ],
        ),
        ),
      ),
    );
  }
}
