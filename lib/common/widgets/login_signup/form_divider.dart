import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class SOFormDivider extends StatelessWidget {
  const SOFormDivider({super.key, required this.dividerText,});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? SOColors.darkGrey: SOColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? SOColors.darkGrey: SOColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}