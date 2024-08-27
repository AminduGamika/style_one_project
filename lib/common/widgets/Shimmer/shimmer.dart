import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

class SOShimmerEffect extends StatelessWidget {
  const SOShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  }) : super(key: key);

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? SOColors.darkerGrey : SOColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
    );
  }
}
