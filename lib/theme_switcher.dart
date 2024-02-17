import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkMode = false;
  void switchTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
