import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme) {
    _loadTheme();
  }

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      state = darkTheme;
      _saveTheme('dark');
    } else {
      state = lightTheme;
      _saveTheme('light');
    }
    debugPrint('theme changed now to: ${state.brightness} and also saved');
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    state = theme == 'light' ? lightTheme : darkTheme;
  }

  void _saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }
}
