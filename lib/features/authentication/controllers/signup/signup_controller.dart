import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/data/repositories/authentication/authentication_repository.dart';
import 'package:style_one/data/repositories/user/user_repository.dart';
import 'package:style_one/utils/popups/loaders.dart';
import 'package:style_one/utils/constants/image_strings.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // --- Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for hiding/showing password
  final email = TextEditingController(); // controller for Email input
  final firstName = TextEditingController(); // controller for firstName input
  final lastName = TextEditingController(); // controller for lastName input
  final username = TextEditingController(); // controller for userName input
  final password = TextEditingController(); // controller for password input
  final phoneNumber = TextEditingController(); // controller for phoneNumber input
  GlobalKey<FormState> signupFromKey = GlobalKey<FormState>(); // Form Key for Form validation

  // --- SIGNUP
  void signup() async {
    try {
      // Start Loading
      SOFullScreenLoader.openLoadingDialog('We are processing Your Information...', SOImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SOFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!signupFromKey.currentState!.validate()) {
        // Remove Loader
        SOFullScreenLoader.stopLoading();
        return;
      }


      // Privacy Policy Check
      if (!privacyPolicy.value) {
        SOLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecode(newUser);

      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // show success Message
      SOLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      } catch (e) {
      // Remove Loader
      SOFullScreenLoader.stopLoading();

      // show some generic Error to the user
      SOLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

      }
  }
}
