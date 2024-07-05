import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.grey.shade200,
    onPrimary: Colors.black26,
    secondary: Colors.grey.shade400,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    primaryContainer: Colors.grey.shade300,
    secondaryContainer: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade800,
    outline: Colors.grey.shade600,
    surfaceTint: Colors.grey.shade100,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey[800],
        displayColor: Colors.black,
      ),
);
