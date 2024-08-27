import 'package:flutter/material.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class SOCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a background color,
  ///
  /// Properties are :
  /// Container [width], [height], & [backgroundColor].
  ///
  /// Icon's [size], [color] & [onPressed]
  const SOCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = SOSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SOSizes.xs),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor!
              : SOHelperFunctions.isDarkMode(context)
                  ? SOColors.black.withOpacity(0)
                  : SOColors.white.withOpacity(0),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
            onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
      ),
    );
  }
}
