import 'package:flutter/material.dart';

import '../../../../../common/widgets/price/product_price_text.dart';
import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';

class SOCartItems extends StatelessWidget {
  const SOCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(height: SOSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [

          // - cart item
          const SOCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: SOSizes.spaceBtwItems),

          // - Add Remove Button Row With total Price
          if(showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),

                  // -- ADD REMOVE BUTTON
                  SOProductQuantityWithAddRemoveButton(),
                ],
              ),

              // - Price Tag
              SOProductPriceText(price: '1800')

            ],
          ),
        ],
      ),
    );
  }
}