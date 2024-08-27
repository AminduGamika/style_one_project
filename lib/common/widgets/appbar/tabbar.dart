import 'package:flutter/material.dart';
import 'package:style_one/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class SOTabBar extends StatelessWidget implements PreferredSizeWidget{
  /// If you want add the background color to tabs you have to wrap them in material widget.
  /// To do that we need [PreferredSized] widget and that's way created custom class [PreferredSizeWidget]
  const SOTabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? SOColors.black : SOColors.white,
      child: TabBar(
          tabs: tabs,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          indicatorColor: SOColors.primary,
          labelColor: dark? SOColors.white : SOColors.primary,
          unselectedLabelColor: SOColors.darkGrey,
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SODeviceUtils.getAppBarHeight());
}