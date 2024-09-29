import 'package:epic_eats/screens/login_screen.dart';
import 'package:epic_eats/screens/register_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screensIndexProvider = StateProvider((ref) => 0);

final screensProvider = Provider((ref) {
  return [
    LoginScreen(),
    RegisterScreen(),
  ];
});
