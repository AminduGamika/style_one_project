import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/features/personalization/screens/address/widgets/single_address.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';

import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: SOColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: SOColors.white),
      ),
      appBar: SOAppBar(title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [
              SOSingleAddress(selectedAddress: false),
              SOSingleAddress(selectedAddress: true),
              SOSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
