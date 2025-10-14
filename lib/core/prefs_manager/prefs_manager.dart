import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{

  static late SharedPreferences prefs;
  static Future<void> init() async{
    prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode newTheme) async {
    String theme = newTheme == ThemeMode.light ? "Light" : "Dark";
    prefs.setString(CacheConstant.themeKey, theme);
  }

  static ThemeMode? getSavedTheme() {
    String? savedTheme = prefs.getString(CacheConstant.themeKey);
    if(savedTheme == null){
      return null;
    }else{
      ThemeMode themeMode = savedTheme == "Light" ? ThemeMode.light : ThemeMode.dark;
      return themeMode;
    }
  }

  static String? saveLanguage(String newLang){
    prefs.setString(CacheConstant.languageKey, newLang);
  }

  static getSavedLanguage (){
    String? saveLanguage = prefs.getString(CacheConstant.languageKey);
    return saveLanguage;
  }
}