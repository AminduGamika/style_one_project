import 'package:flutter/cupertino.dart';

import 'curved_edges.dart';

class SOCurvedEdgeWidget extends StatelessWidget {
  const SOCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SOCustomCurvedEdges(),
      child: child,
    );
  }
}