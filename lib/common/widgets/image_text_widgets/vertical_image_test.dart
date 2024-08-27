import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/images/so_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SOVerticalImageText extends StatelessWidget {
  const SOVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = SOColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SOSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            SOCircularImage(
                image: image,
                fit: BoxFit.fitWidth,
                padding: SOSizes.sm * 1.4,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: SOHelperFunctions.isDarkMode(context) ? SOColors.light : SOColors.dark,
            ),

            /// Texts
            const SizedBox(height: SOSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}