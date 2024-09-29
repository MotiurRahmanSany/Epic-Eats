import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme);

  void toggleTheme() {
    state = state.brightness == Brightness.light ? darkTheme : lightTheme;
    debugPrint('theme changed now: ${state.brightness}');
  }
}
