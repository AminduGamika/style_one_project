import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/so_circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SOProductImageSlider extends StatelessWidget {
  const SOProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return SOCurvedEdgeWidget(
      child: Container(
        color: dark ? SOColors.darkerGrey : SOColors.light,
        child: Stack(
          children: [
            // -- Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(SOSizes.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(SOImages.s_4_5))),
              ),
            ),

            // -- Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SOSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: Center(
                  child: ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: SOSizes.spaceBtwItems),
                    itemBuilder: (_, index) => SORoundedImage(
                        width: 80,
                        backgroundColor:
                        dark ? SOColors.dark : SOColors.white,
                        border: Border.all(color: SOColors.primary),
                        padding: const EdgeInsets.all(SOSizes.sm),
                        imageUrl: SOImages.s_4_5),
                  ),
                ),
              ),
            ),

            // -- AppBar Icons
            const SOAppBar(
              showBackArrow: true,
              actions: [SOCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}
