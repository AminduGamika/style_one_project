import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/bindings/general_bindings.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/theme/theme.dart';

// -- Use this class to setup themes, initial bindings, any animations and much more using material widget.
class App  extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SOTheme.lightTheme,
      darkTheme: SOTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Leader Or Circular progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: SOColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}