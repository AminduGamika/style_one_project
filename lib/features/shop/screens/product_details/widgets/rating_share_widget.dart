import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class SORatingAndShare extends StatelessWidget {
  const SORatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///  Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: SOSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                    const TextSpan(text: '(28)'),
                  ]
              ),
            ),
          ],
        ),

        ///  Share
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: SOSizes.iconMd)),

      ],
    );
  }
}