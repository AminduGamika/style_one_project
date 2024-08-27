import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:style_one/data/repositories/authentication/authentication_repository.dart';
import 'package:style_one/features/personalization/controllers/user_controller.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/popups/full_screen_loader.dart';
import 'package:style_one/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';

class LoginController extends GetxController{

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  /*@override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }*/

  /// --- Email and password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      SOFullScreenLoader.openLoadingDialog('Logging you in...', SOImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // Redirect Loader
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SOFullScreenLoader.stopLoading();
      SOLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// --- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start loading
      SOFullScreenLoader.openLoadingDialog('Loading you in...', SOImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Remove Loader
      SOFullScreenLoader.stopLoading();
      SOLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}