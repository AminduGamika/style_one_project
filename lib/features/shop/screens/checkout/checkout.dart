import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/common/widgets/success_screen/success_screen.dart';
import 'package:style_one/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:style_one/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:style_one/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:style_one/navigation_menu.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/product/cart/coupon_widget.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Scaffold(
      /// --- APPBAR
      appBar: SOAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),

      /// --- BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [
              // -- Items in cart
              const SOCartItems(showAddRemoveButtons: false),
              const SizedBox(height: SOSizes.spaceBtwSections),

              // -- Coupon TexField
              const SOCouponCode(),
              const SizedBox(height: SOSizes.spaceBtwSections),

              // -- Billing Section
              SORoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(SOSizes.md),
                backgroundColor: dark ? SOColors.black : SOColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    SOBillingAmountSection(),
                    SizedBox(height: SOSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: SOSizes.spaceBtwItems),

                    // Payment method
                    SOBillingPaymentSection(),
                    SizedBox(height: SOSizes.spaceBtwItems),

                    // Address
                    SOBillingAddressSection(),
                    SizedBox(height: SOSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// ----- Checkout Button
      bottomNavigationBar: Padding(
        padding:  const EdgeInsets.all(SOSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: SOImages.success,
                title: 'Payment Success!',
                subTitle: 'Your item will be deliver soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
             ),
            ),
            child: const Text('Checkout LKR.2,400')),
      ),
    );
  }
}
