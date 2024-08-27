
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:style_one/data/repositories/authentication/authentication_repository.dart';
import 'package:style_one/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/signup/verify_email.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      SOFullScreenLoader.openLoadingDialog('Processing your request...', SOImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // show success Message
      SOLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // show some generic Error to the user
      SOLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      SOFullScreenLoader.openLoadingDialog('Processing your request...', SOImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // show success Message
      SOLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

    } catch (e) {
      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // show some generic Error to the user
      SOLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}