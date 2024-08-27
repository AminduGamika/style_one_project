import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/features/authentication/controllers/signup/signup_controller.dart';
import 'package:style_one/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:style_one/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

class SOSignupForm extends StatelessWidget {
  const SOSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFromKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(

                // first name
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => SOValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: SOTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: SOSizes.spaceBtwInputFields),
              Expanded(

                // lastName
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => SOValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: SOTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: SOSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) => SOValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: SOTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: SOSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => SOValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: SOTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: SOSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => SOValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: SOTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: SOSizes.spaceBtwInputFields),

          /// Password
          Obx(
          () => TextFormField(
              validator: (value) => SOValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: SOTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: SOSizes.spaceBtwInputFields),

          /// Terms & Conditions Checkbox
          const SOTermsAndConditionsCheckbox(),
          const SizedBox(height: SOSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(SOTexts.createAccount),
              ),
          ),
        ],
      ),
    );
  }
}
