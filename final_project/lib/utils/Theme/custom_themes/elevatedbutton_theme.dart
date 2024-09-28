import 'package:flutter/material.dart';

class MyElevatedbuttonTheme {
  MyElevatedbuttonTheme._();

  // light theme
  static final lightElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 10,
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.deepPurple),
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
  // dark theme
  static final darkElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 10,
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.deepPurple),
      padding: const EdgeInsets.all(16),
      textStyle: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
