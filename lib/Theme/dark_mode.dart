import 'package:flutter/material.dart';

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.grey.shade800,
    onPrimary: Colors.white,
    secondary: Colors.grey.shade700,
    onSecondary: Colors.white,
    error: Colors.red.shade800,
    onError: Colors.white,
    surface: Colors.grey.shade900,
    onSurface: Colors.white,
    primaryContainer: Colors.grey.shade700,
    secondaryContainer: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
    outline: Colors.grey.shade400,
    surfaceTint: Colors.grey.shade900,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.grey[300],
        displayColor: Colors.white,
      ),
);
