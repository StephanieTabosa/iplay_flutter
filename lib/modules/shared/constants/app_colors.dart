import 'package:flutter/material.dart';

class AppColors {
  static const int _primaryValue = 0xFF050C33;
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );

  static const text = Color(0xFF161616);

  static const secondary = Color(0xFFE51C44);

  static const green = Color(0xFF2CD2A8);

  static const red = Color(0xFF9A1F19);

  static const white = Color(0xFFFFFFFF);

  static const lightGrey = Color(0xFFDDE5F6);
}
