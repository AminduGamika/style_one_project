import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:style_one/data/repositories/user/user_repository.dart';
import 'package:style_one/features/authentication/screens/login/login.dart';
import 'package:style_one/features/authentication/screens/onboarding/onboarding.dart';
import 'package:style_one/features/authentication/screens/signup/verify_email.dart';
import 'package:style_one/navigation_menu.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// ----- Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// ---- Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// ----- Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// ----- Function to show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;

    if(user != null) {
      // If the user is logged in
      if(user.emailVerified) {
        // If the user's email is verified, navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else{
        // If the user's email is not verified, navigate to the main Navigation Menu
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(const OnBoardingScreen()); // Redirect to onboarding screen if it's the first time
    }

  }

  /* ------------------------ Email & Password sign-in -------------------*/

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /// [ReAuthentication] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /* ------------------------ Federated identity & social sign-in -------------------*/

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Ones signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      throw SOFirebaseAuthException('google-sign-in-failed');
    }
  }

  /// [FacebookAuthentication] - FACEBOOK

  /* ------------------------ ./end Federated identity & social sign-i -------------------*/

  /// [LogoutUser] - Valid For any authentication.
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Delete User] - Remove user Authentication and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SOFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const SOFormatException();
    } on PlatformException catch (e) {
      throw SOPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}
