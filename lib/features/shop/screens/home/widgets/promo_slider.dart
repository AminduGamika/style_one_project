import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/features/shop/controllers/home_controller.dart';
import 'package:style_one/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class SOPromoSlider extends StatelessWidget {
  const SOPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => SORoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(height: SOSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  SOCircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carousalCurrentIndex.value == i ? SOColors.primary : SOColors.grey),
              ],
            ),
          ),
        )
      ],
    );
  }
}