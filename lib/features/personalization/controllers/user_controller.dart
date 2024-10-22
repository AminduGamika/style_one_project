import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:style_one/data/repositories/authentication/authentication_repository.dart';
import 'package:style_one/data/repositories/user/user_repository.dart';
import 'package:style_one/features/authentication/screens/login/login.dart';
import 'package:style_one/features/personalization/models/user_model.dart';
import 'package:style_one/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/popups/full_screen_loader.dart';
import 'package:style_one/utils/popups/loaders.dart';

import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFromKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {

      // First Upload RX User and then check if user data is already stored. If not store new data.
      await fetchUserRecord();

      // If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');


          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join('  ')
                : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecode(user);
        }
      }
    } catch (e) {
      SOLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your Profile.'
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(SOSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: SOSizes.lg), child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      SOFullScreenLoader.openLoadingDialog('Processing', SOImages.docerAnimation);

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          SOFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          SOFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      SOFullScreenLoader.stopLoading();
      SOLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      SOFullScreenLoader.openLoadingDialog('Processing', SOImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFromKey.currentState!.validate()) {
        SOFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      SOFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      SOFullScreenLoader.stopLoading();
      SOLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }

  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
    if(image != null){
      imageUploading.value = true;
      // Upload Image
      final imageUrl = await userRepository.uploadImage('User/Image/Profile/', image);

      // Upload User Image Record
      Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
      await userRepository.updateSingleField(json);

      user.value.profilePicture = imageUrl;
      user.refresh();
      SOLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has Been Updated!');
    }
  } catch (e) {
      SOLoaders.errorSnackBar(title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}