

import 'package:flutter/material.dart';

class MyAppBar {
  MyAppBar._();

  // light
  static const lightAppBar = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size:24),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black,size:24),

  );
  // dark
  static const darkAppBar = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black,size:24),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white,size:24),

  );
}
