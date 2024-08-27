import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widgets.dart';
import 'circular_container.dart';

class SOPrimaryHeaderContainer extends StatelessWidget {
  const SOPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SOCurvedEdgeWidget(
      child: Container(
        color: SOColors.primary,

          //// -- If [size.isFinite': is not true.in stack] error occurred -> Read README.md files at [DESIGN ERRORS] #1
          child: Stack(
            children: [
              ////--- Background Custom Shape
              Positioned(top: -150, right: -250, child: SOCircularContainer(backgroundColor: SOColors.textWhite.withOpacity(0.1))),
              Positioned(top: 100, right: -300, child: SOCircularContainer(backgroundColor: SOColors.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
      ),
    );
  }
}
