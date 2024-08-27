import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class SOGridLayout extends StatelessWidget {
  const SOGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: SOSizes.gridViewSpacing,
        crossAxisSpacing: SOSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
