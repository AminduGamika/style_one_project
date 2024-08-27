import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/layouts/grid_layouts.dart';
import 'package:style_one/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class SOCategoryTab extends StatelessWidget {
  const SOCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children : [
      Padding(
        padding: const EdgeInsets.all(SOSizes.defaultSpace),
        child: Column(
          children: [
            //// ---- Brands
            const SOBrandShowcase(images: [SOImages.product5, SOImages.product2, SOImages.product7]),
            const SOBrandShowcase(images: [SOImages.product8, SOImages.product1, SOImages.product6]),
            const SizedBox(height: SOSizes.spaceBtwItems),

            //// ---- Products
            SOSectionHeading(title: 'You might like', onPressed: (){}),
            const SizedBox(height: SOSizes.spaceBtwItems),

            SOGridLayout(itemCount: 4, itemBuilder: (_, index) => const SOProductCardVertical()),
          ],
        ),
      ),
      ]
    );
  }
}
