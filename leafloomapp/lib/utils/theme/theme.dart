import 'package:flutter/material.dart';
import 'package:leafloom/utils/theme/custon_themes/appbar_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/bottom_sheet_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/checkbox_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/chip_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/elevated_button_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/outlined_button_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/text_field_theme.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class LAppTheme {
  LAppTheme._();

  //light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Schyler',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: LTextTheme.lightTheme,
    chipTheme: LChipTheme.lightChipTheme,
    appBarTheme: LAppBarTheme.lightAppBarTheme,
    checkboxTheme: LCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: LBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: LElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: LTextFromFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: LOutlinedButtonTheme.lightOutlinedButtonTheme,
  );
  //dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Schyler',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: LTextTheme.darkTheme,
    chipTheme: LChipTheme.darkChipTheme,
    appBarTheme: LAppBarTheme.darkAppBarTheme,
    checkboxTheme: LCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: LBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: LElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: LTextFromFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: LOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
