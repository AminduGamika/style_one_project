import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/success_screen/success_screen.dart';
import 'dart:async';
import 'package:style_one/data/repositories/authentication/authentication_repository.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/text_string.dart';
import 'package:style_one/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send email whenever Verify Screen appears & Set Time for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SOLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      SOLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Time to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
          (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
                  () => SuccessScreen(
                    image: SOImages.successfullyRegisterAnimation,
                    title: SOTexts.yourAccountCreatedTitle,
                    subTitle: SOTexts.yourAccountCreatedSubTitle,
                    onPressed: () => AuthenticationRepository.instance.screenRedirect(),
                  ),
          );
        }
      },
    );
  }

  // Manually check if Email Verified
  checkEmailVerificationsStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () => SuccessScreen(
              image: SOImages.successfullyRegisterAnimation,
              title: SOTexts.yourAccountCreatedTitle,
              subTitle: SOTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
      );
    }
  }


}
