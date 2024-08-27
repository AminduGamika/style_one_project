import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/so_circular_image.dart';
import '../texts/so_brand_title_text_with_verified_icon.dart';

class SOBrandCard extends StatelessWidget {
  const SOBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = SOHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: SORoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(SOSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ---- Icon
            Flexible(
              child: SOCircularImage(
                isNetworkImage: false,
                image: SOImages.moose,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? SOColors.white : SOColors.black,
              ),
            ),
            const SizedBox(width: SOSizes.spaceBtwItems / 2),

            /// ---- Text
            // -- [Expended] & Column [mainAxisSize.min] is Important to keep the elements in the vertical center and also
            // to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SOBrandTitleWidthVerifiedIcon(
                      title: 'Moose',
                      brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
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