import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:style_one/app.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

/// Entry Point of flutter App
Future<void> main() async {

  /// --- Add widgets building
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// --- GetX Local Storage
  await GetStorage.init();

  //Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //Todo: Initialize Authentication

  runApp(const App());
}

