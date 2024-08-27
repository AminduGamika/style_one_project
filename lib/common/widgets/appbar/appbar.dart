import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/device/device_utility.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';

class SOAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SOAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

    final Widget? title;
    final bool showBackArrow;
    final IconData? leadingIcon;
    final List<Widget>? actions;
    final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: SOSizes.md),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: showBackArrow
                  ? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left, color: dark ? Colors.white : SOColors.dark))
                  : leadingIcon != null ?
                    IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
              title: title,
              actions: actions,
            ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SODeviceUtils.getAppBarHeight());
}
