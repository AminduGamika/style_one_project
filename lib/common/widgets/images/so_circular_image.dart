import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/Shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SOCircularImage extends StatelessWidget {
  const SOCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = SOSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // If image background color is null then switch to light and dark mode color design
        color: backgroundColor ??
            (SOHelperFunctions.isDarkMode(context)
                ? SOColors.black
                : SOColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
          ? CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) => const SOShimmerEffect(width: 55, height: 55),
            errorWidget: (context,url, error) => const Icon(Icons.error),
          )
          : Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
            // color: SOHelperFunctions.isDarkMode(context) ? SOColors.white : SOColors.dark,
          ),
        ),
      ),
    );
  }
}
