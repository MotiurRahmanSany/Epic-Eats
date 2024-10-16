import 'package:epic_eats/core/constants/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme) {
    _loadThemeFromDB();
  }

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      state = darkTheme;
      _saveThemeToDB('dark');
    } else {
      state = lightTheme;
      _saveThemeToDB('light');
    }
  }

  final themeBox = Hive.box<String>(HiveConstants.prefBoxName);

  void _loadThemeFromDB() async {
    final theme = themeBox.get(HiveConstants.themeKey, defaultValue: 'light');
    state = theme == 'light' ? lightTheme : darkTheme;
  }

  void _saveThemeToDB(String theme) async {
    themeBox.put(HiveConstants.themeKey, theme);
  }
}
