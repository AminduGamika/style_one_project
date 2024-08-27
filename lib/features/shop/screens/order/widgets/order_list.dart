import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class SOOrderListItems extends StatelessWidget {
  const SOOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 7,
      separatorBuilder: (_, __) => const SizedBox(height: SOSizes.spaceBtwItems),
      itemBuilder: (_, __) => SORoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(SOSizes.md),
        backgroundColor: dark ? SOColors.dark : SOColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// --- Row --------- 1
            Row(
              children: [
                // Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: SOSizes.spaceBtwItems / 2),

                // Status & date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: SOColors.primary, fontWeightDelta: 1)),
                      Text('02 Jul 2024', style: Theme.of(context).textTheme.headlineSmall),

                    ],
                  ),
                ),

                // More Icon
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: SOSizes.iconSm)),

              ],
            ),
            const SizedBox(height: SOSizes.spaceBtwItems),

            /// --- Row --------- 2
            // Order Details
            Row(
              children: [
                Expanded (
                  child: Row(
                    children: [
                      // Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: SOSizes.spaceBtwItems / 2),

                      // Status & date
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#0001]', style: Theme.of(context).textTheme.titleMedium),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Deliver Date
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: SOSizes.spaceBtwItems / 2),

                      // Status & date
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Deliver Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('10 Jul 2024', style: Theme.of(context).textTheme.titleMedium),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
