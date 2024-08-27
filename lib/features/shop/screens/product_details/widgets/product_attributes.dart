import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/common/widgets/price/product_price_text.dart';
import 'package:style_one/common/widgets/texts/product_title_text.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SOProductAttributes extends StatelessWidget {
  const SOProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// --- Selected Attribute pricing & Description
        SORoundedContainer(
          padding: const EdgeInsets.all(SOSizes.md),
          backgroundColor: dark ? SOColors.darkerGrey : SOColors.grey,
          child: Column(
            children: [
              /// -- Title, Price and Stock Status
              Row(
                children: [
                  const SOSectionHeading(
                      title: 'Variations', showActionButton: false),
                  const SizedBox(width: SOSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SOProductTitleText(
                              title: 'Price : ', smallSize: true),

                          /// ---- Actual Price
                          Text('LKR.1000',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: SOSizes.spaceBtwItems),

                          /// ---- Sale Price
                          const SOProductPriceText(price: '950'),
                        ],
                      ),

                      /// ---- Stock
                      Row(
                        children: [
                          const SOProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stick',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: SOSizes.spaceBtwItems / 2),

              /// Variation Description
              const SOProductTitleText(
                title:
                    'Snazzy and Hip! Cool to the Core! Fashionable and Funky! Moose Crew Neck T-shirts are out, a wide variety of your '
                    'favourite colors to choose from for all your casual needs!',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: SOSizes.spaceBtwSections),

        /// --- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SOSectionHeading(title: 'Colors', showActionButton: false),
          const SizedBox(height: SOSizes.spaceBtwItems / 2),
          Wrap(
            spacing: 8,
            children: [
              SOChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
              SOChoiceChip(text: 'Red', selected: false, onSelected: (value){}),
              SOChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
              SOChoiceChip(text: 'Pink', selected: false, onSelected: (value){}),
              SOChoiceChip(text: 'Orange', selected: false, onSelected: (value){}),
            ],
          )
        ],
      ),
        const SizedBox(height: SOSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SOSectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(height: SOSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SOChoiceChip(text: 'XS', selected: true, onSelected: (value){}),
                SOChoiceChip(text: 'S', selected: false, onSelected: (value){}),
                SOChoiceChip(text: 'M', selected: true, onSelected: (value){}),
                SOChoiceChip(text: 'L', selected: false, onSelected: (value){}),
                SOChoiceChip(text: 'XL', selected: false, onSelected: (value){}),
                SOChoiceChip(text: 'XXL', selected: false, onSelected: (value){}),
                SOChoiceChip(text: 'XXXL', selected: false, onSelected: (value){}),
              ],
            )
          ],
        ),
    ],
    );
  }
}

