import 'package:epic_eats/core/constants/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {

  @override
  ThemeData build() {
    _loadThemeFromDB();
    return lightTheme;
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
