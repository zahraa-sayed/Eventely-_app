import 'package:evently_app/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getSavedTheme() ?? ThemeMode.light ;

  bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppTheme(ThemeMode newTheme){
    if(currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(currentTheme);
    notifyListeners();
  }
}