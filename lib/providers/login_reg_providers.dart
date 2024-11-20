import 'package:epic_eats/screens/login_screen.dart';
import 'package:epic_eats/screens/register_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screensIndexProvider = StateProvider<int>((ref) => 0);

final hasJustRegisteredProvider = StateProvider<bool>((ref) => false);

final screensProvider = Provider((ref) {
  return [
    LoginScreen(),
    RegisterScreen(),
  ];
});
