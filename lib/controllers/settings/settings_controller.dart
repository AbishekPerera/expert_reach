import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  var selectedMode = 1.obs;
  ThemeMode selectedThemeMode = ThemeMode.system;
  SharedPreferences? prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    int? themeModeIndex = prefs!.getInt('theme_mode');
    if (themeModeIndex != null) {
      selectedMode.value = themeModeIndex;
      updateThemeMode(themeModeIndex);
    }
  }

  void changeIndex(int index) {
    selectedMode.value = index;
    updateThemeMode(index);
    prefs!.setInt('theme_mode', index);
  }

  void updateThemeMode(int index) {
    if (index == 1) {
      selectedThemeMode = ThemeMode.system;
      Get.changeThemeMode(ThemeMode.system);
    } else if (index == 2) {
      selectedThemeMode = ThemeMode.dark;
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      selectedThemeMode = ThemeMode.light;
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
