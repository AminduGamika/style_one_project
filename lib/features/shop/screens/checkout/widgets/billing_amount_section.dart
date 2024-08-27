import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class SOBillingAmountSection extends StatelessWidget {
  const SOBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// --- SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('LKR. 1800', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),

        /// --- Delivery Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('LKR. 500', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),

        /// --- Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('LKR. 100', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),

        /// --- Order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Oder Total', style: Theme.of(context).textTheme.titleMedium),
            Text('LKR. 2400', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),
      ],
    );
  }
}
