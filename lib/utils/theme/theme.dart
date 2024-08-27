import 'package:flutter/material.dart';
import 'package:style_one/utils/theme/custom_themes/appbar_theme.dart';

import 'package:style_one/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:style_one/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:style_one/utils/theme/custom_themes/chip_theme.dart';
import 'package:style_one/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:style_one/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:style_one/utils/theme/custom_themes/text_field_theme.dart';
import 'package:style_one/utils/theme/custom_themes/text_theme.dart';

class SOTheme {
  SOTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: SOTextTheme.lightTextTheme,
    chipTheme: SOChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: SOAppBarTheme.lightAppBarTheme,
    checkboxTheme: SOCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SOBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SOElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SOOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SOTextFormFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: SOTextTheme.darkTextTheme,
      chipTheme: SOChipTheme.darkChipTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: SOAppBarTheme.darkAppBarTheme,
      checkboxTheme: SOCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: SOBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: SOElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: SOOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: SOTextFormFieldTheme.darkInputDecorationTheme,
  );
}