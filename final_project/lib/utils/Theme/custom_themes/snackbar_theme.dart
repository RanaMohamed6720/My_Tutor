import 'package:flutter/material.dart';

class MySnackBar {
  MySnackBar._();

  // light
  static const lightSnackbar = SnackBarThemeData(
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    actionTextColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  // dark
  static const darkSnackbar = SnackBarThemeData(
    backgroundColor: Colors.black87,
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    actionTextColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}
