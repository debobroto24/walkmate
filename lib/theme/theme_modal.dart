import 'package:flutter/material.dart';
import 'package:walkmate/theme/theme_shared_preferences.dart';

class ThemeModal extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreferences themeSharedPreferences;
  ThemeModal() {
    _isDark = false;
    themeSharedPreferences = ThemeSharedPreferences();
    getThemePreferences();
  }

  bool get isDark => _isDark;

  setIsDark(value) async {
    await themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async {
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}
