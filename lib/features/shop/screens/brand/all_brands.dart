import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/features/shop/screens/brand/brand_product.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layouts.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SOAppBar(title: Text('Brand', style: Theme
          .of(context)
          .textTheme
          .headlineMedium), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [

              // --- Heading
              const SOSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: SOSizes.spaceBtwItems),

              // --- Brands
              SOGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => SOBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const BrandProduct()),
                  ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
