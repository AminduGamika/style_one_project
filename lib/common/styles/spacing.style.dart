import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:style_one/utils/constants/sizes.dart';

class SOSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: SOSizes.appBarHeight,
    left: SOSizes.defaultSpace,
    bottom: SOSizes.defaultSpace,
    right: SOSizes.defaultSpace,
  );
}