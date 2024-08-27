import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/rounded_image.dart';
import 'brand_card.dart';

class SOBrandShowcase extends StatelessWidget {
  const SOBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SORoundedContainer(
      showBorder: true,
      borderColor: SOColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(SOSizes.md),
      margin: const EdgeInsets.only(bottom: SOSizes.spaceBtwItems),
      child: Column(
        children: [

          /// Brand With Product Count
          const SOBrandCard(showBorder: false),
          const SizedBox(height: SOSizes.spaceBtwItems),
          /// Brand Top 3 Product Images
          Row(
              children: images.map((image) => brandProductImageWidget(image, context)).toList()),
        ],
      ),
    );
  }

  /// ---- Brand Images
  Widget brandProductImageWidget(String image, context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.xs /2),
          child: SORoundedImage(
              imageUrl: image,
              applyImageRadius: true,
              height: 100,
              backgroundColor: SOHelperFunctions.isDarkMode(context) ? SOColors.darkerGrey : SOColors.light,
              padding: const EdgeInsets.all(SOSizes.xs),
          ),
        ),

      // SORoundedImage(
      //   imageUrl: image,
      //   applyImageRadius: true,
      //   height: 100,
      //   backgroundColor: SOHelperFunctions.isDarkMode(context) ? SOColors.darkerGrey : SOColors.light,
      //   padding: const EdgeInsets.all(SOSizes.xs),
      // ),

    //     SORoundedContainer(
    //     height: 96,
    //     padding: const EdgeInsets.all(SOSizes.sm / 1.5),
    //     margin: const EdgeInsets.only(right: SOSizes.sm),
    //     backgroundColor: SOHelperFunctions.isDarkMode(context) ? SOColors.darkerGrey : SOColors.light,
    //     child: Image(fit: BoxFit.contain, image: AssetImage(image)),


    );
  }
}