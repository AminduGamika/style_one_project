import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/brand/brand_card.dart';
import 'package:style_one/common/widgets/product/sortable/sortable_products.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SOAppBar(title: Text('Moose', style: Theme
          .of(context)
          .textTheme
          .headlineMedium), showBackArrow: true),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [

              /// Brand Details
              SOBrandCard(showBorder: true),
              SizedBox(height: SOSizes.spaceBtwSections),

              SOSortableProducts(),


            ],
          ),
        ),
      ),

    );
  }
}
