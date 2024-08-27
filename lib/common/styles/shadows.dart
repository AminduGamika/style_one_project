import 'package:flutter/material.dart';
import 'package:style_one/utils/constants/colors.dart';

class SOShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: SOColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: SOColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}