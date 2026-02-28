import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
