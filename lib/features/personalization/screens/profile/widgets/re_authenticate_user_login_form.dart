import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/features/personalization/controllers/user_controller.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/constants/text_string.dart';
import 'package:style_one/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: SOValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: SOTexts.email),
                ),
                const SizedBox(height: SOSizes.spaceBtwInputFields),

                /// Password
                Obx(
                      () => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) => SOValidator.validateEmptyText('Password', value),
                        decoration: InputDecoration(
                          labelText: SOTexts.password,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                            icon: const Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: SOSizes.spaceBtwSections),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
