import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/Shimmer/shimmer.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/product/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';

class SOHomeAppBar extends StatelessWidget {
  const SOHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SOAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SOTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: SOColors.grey)),
          Obx(
                () {
              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is being loaded
                return const SOShimmerEffect(width: 80, height: 15);
              } else {
                return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: SOColors.white));
              }

            },
          ),
        ],
      ),
      actions: [
        SOCartCounterIcon(onPressed: () {}, iconColor: SOColors.white)],
    );
  }
}