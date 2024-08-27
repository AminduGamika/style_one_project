import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SOSingleAddress extends StatelessWidget {
  const SOSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return SORoundedContainer(
      padding: const EdgeInsets.all(SOSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? SOColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? SOColors.darkerGrey
              : SOColors.grey,
      margin: const EdgeInsets.only(bottom: SOSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? SOColors.light
                        : SOColors.dark.withOpacity(0.6)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // - Name
              Text(
                'Style One',
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: SOSizes.sm / 2),

              // - Phone Number
              const Text('(+94) 70 4343 007',
                  maxLines:1,
                  overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: SOSizes.sm / 2),

              // - Address
              const Text(
                'No. 255/24,\nMihindu Mawatha, \nKottawa, Homagama. 10230',
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: SOSizes.sm / 2),

            ],
          )
        ],
      ),
    );
  }
}
