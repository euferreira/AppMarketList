import 'package:flutter/material.dart';

import '../shared/constants.dart';

class AppTheme {
  static final ThemeData themeLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        foregroundColor: ColorsPallet.light0,
        backgroundColor: ColorsPallet.blue700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsPallet.blue500,
      foregroundColor: ColorsPallet.light100,
    ),
  );
}
