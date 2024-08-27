import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class SORatingBarIndicator extends StatelessWidget {
  const SORatingBarIndicator({
    super.key, required this.ratings,
  });

  final double ratings;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: ratings,
      itemSize: 20,
      unratedColor: SOColors.grey,
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: SOColors.primary),
    );
  }
}