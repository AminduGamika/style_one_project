import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:style_one/common/widgets/Shimmer/shimmer.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

class SOCategoryShimmer extends StatelessWidget {
  const SOCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: SOSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              SOShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: SOSizes.spaceBtwItems / 2),

              // Text
              SOShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
