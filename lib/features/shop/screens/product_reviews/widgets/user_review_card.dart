import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/product/ratings/rating_indicator.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({ super.key});



  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          /// --- Avatar, Name & More Button
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(SOImages.girlsIcon)),
                const SizedBox(width: SOSizes.spaceBtwItems),
                Text("Amindu Gamika", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems),

        /// --- Reviews
        Row(
          children: [
            const SORatingBarIndicator(ratings: 4),
            const SizedBox(width: SOSizes.spaceBtwItems),
            Text("01 Jul, 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems),

        /// - Comment
        const ReadMoreText('The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Grate job! Thanks you Style One.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more... ',
          trimExpandedText: '   Show Less... ',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SOColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SOColors.primary),
        ),
        const SizedBox(height: SOSizes.spaceBtwItems),

        /// - Company Comment
        SORoundedContainer(
          backgroundColor: dark ? SOColors.darkerGrey : SOColors.grey,
          child: Padding(
              padding: const EdgeInsets.all(SOSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Style One", style: Theme.of(context).textTheme.titleMedium),
                      Text("02 Jul, 2024", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: SOSizes.spaceBtwItems),
                  const ReadMoreText('The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Grate job! Thanks you Style One.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more... ',
                    trimExpandedText: '   Show Less... ',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SOColors.primary),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: SOColors.primary),
                  ),
                ],
              ),
          ),
        ),
        const SizedBox(height: SOSizes.spaceBtwSections),

      ],
    );
  }
}
