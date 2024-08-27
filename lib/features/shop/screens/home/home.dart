import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/features/shop/screens/all_products/all_products.dart';
import 'package:style_one/features/shop/screens/home/widgets/home_categories.dart';
import 'package:style_one/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layouts.dart';
import '../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// ---------- Header
            const SOPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: SOSizes.spaceBtwItems),

                  /// ---------- Appbar
                  SOHomeAppBar(),
                  SizedBox(height: SOSizes.spaceBtwSections),

                  /// ---------- SearchBar
                  SOSearchContainer(text: 'Search in Store'),
                  SizedBox(height: SOSizes.spaceBtwSections),

                  /// ----------- Categories
                  Padding(
                    padding: EdgeInsets.only(left: SOSizes.defaultSpace),
                    child: Column(
                      children: [

                        /// -------- Heading
                        SOSectionHeading(
                            title: "Popular Categories",
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: SOSizes.spaceBtwItems),

                        /// -------- Categories
                        SOHomeCategory(),
                      ],
                    ),
                  ),
                  SizedBox(height: SOSizes.spaceBtwSections),
                ],
              ),
            ),

            //// ---------- Body
            Padding(
              padding: const EdgeInsets.all(SOSizes.defaultSpace),
              child: Column(
                children: [

                  /// ----- Promo Slider
                  const SOPromoSlider(banners: [SOImages.promoBanner1, SOImages.promoBanner2]),
                  const SizedBox(height: SOSizes.spaceBtwSections),

                  /// ------ Heading
                  SOSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: SOSizes.spaceBtwItems),

                  /// ----- Popular products
                  SOGridLayout(itemCount: 4, itemBuilder: (_, index) => const SOProductCardVertical()),
                  const SizedBox(height: SOSizes.spaceBtwSections * 1.5),


                  /// ----- Promo Slider
                  const SOPromoSlider(banners: [SOImages.promoBanner2, SOImages.promoBanner1]),
                  const SizedBox(height: SOSizes.spaceBtwSections),

                  /// ------ Heading
                  SOSectionHeading(title: 'New Arrivals', onPressed: (){}),
                  const SizedBox(height: SOSizes.spaceBtwItems),

                  /// ----- Popular products
                  SOGridLayout(itemCount: 6, itemBuilder: (_, index) => const SOProductCardVertical()),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




