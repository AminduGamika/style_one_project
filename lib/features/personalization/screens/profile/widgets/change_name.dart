import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/validators/validation.dart';

import '../../../../../utils/constants/text_string.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// -- Custom Appbar
      appBar: SOAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SOSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text('Use real name for easy verification. This name will apper on several pages.',
            style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: SOSizes.spaceBtwSections),

            /// Text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => SOValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: SOTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
              const SizedBox(height: SOSizes.spaceBtwSections),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => SOValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: SOTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                 ),
                ],
              )),
            const SizedBox(height: SOSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
