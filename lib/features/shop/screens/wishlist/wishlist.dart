import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/common/widgets/icons/so_circular_icon.dart';
import 'package:style_one/common/widgets/layouts/grid_layouts.dart';
import 'package:style_one/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:style_one/features/shop/screens/home/home.dart';
import 'package:style_one/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SOAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          SOCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [
              SOGridLayout(itemCount: 9, itemBuilder: (_, index) => const SOProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
