import 'package:flutter/material.dart';

class ThemeSwitch with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void updateThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void syncWithSystemTheme(BuildContext context) {
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    _themeMode = platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
