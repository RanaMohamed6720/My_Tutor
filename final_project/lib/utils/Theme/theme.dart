import 'package:final_project/utils/Theme/custom_themes/appbar_theme.dart';
import 'package:final_project/utils/Theme/custom_themes/elevatedbutton_theme.dart';
import 'package:final_project/utils/Theme/custom_themes/snackbar_theme.dart';
import 'package:final_project/utils/Theme/custom_themes/text_theme.dart';
import 'package:final_project/utils/Theme/custom_themes/textformfield_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // _ for private constructor
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: MyElevatedbuttonTheme.lightElevatedButton,
    appBarTheme: MyAppBar.lightAppBar,
    inputDecorationTheme: MyTextFormField.lightInputDecoration,
    snackBarTheme: MySnackBar.lightSnackbar,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey[850],
    textTheme: MyTextTheme.darkTextTheme,
    elevatedButtonTheme: MyElevatedbuttonTheme.darkElevatedButton,
    appBarTheme: MyAppBar.darkAppBar,
    inputDecorationTheme: MyTextFormField.darkInputDecoration,
    snackBarTheme: MySnackBar.darkSnackbar,
  );
}
