import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SOSearchContainer extends StatelessWidget {
  const SOSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: SOSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SODeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SOSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? SOColors.dark
                      : SOColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(SOSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: SOColors.grey) : null),
          child: Row(
            children: [
              Icon(icon, color: SOColors.darkerGrey),
              const SizedBox(width: SOSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
