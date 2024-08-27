import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class SOCouponCode extends StatelessWidget {
  const SOCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SOHelperFunctions.isDarkMode(context);
    return SORoundedContainer(
      showBorder: true,
      backgroundColor: dark ? SOColors.dark : SOColors.white,
      padding: const EdgeInsets.only(top: SOSizes.sm, bottom: SOSizes.sm, right: SOSizes.sm, left: SOSizes.md),
      child: Row(
        children: [

          // - TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          // Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: dark ? SOColors.white.withOpacity(0.5) : SOColors.dark.withOpacity(0.5),
                    backgroundColor: SOColors.grey.withOpacity(0.2),
                    side: BorderSide(color: SOColors.grey.withOpacity(0.1)),
                  ),
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}