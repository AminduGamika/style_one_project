import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:style_one/features/shop/screens/checkout/checkout.dart';
import 'package:style_one/utils/constants/sizes.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SOAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(SOSizes.defaultSpace),

        /// ---- ITEMS IN CART
        child: SOCartItems(),
      ),

      /// ----- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SOSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout LKR.3600')),
      ),
    );
  }
}




