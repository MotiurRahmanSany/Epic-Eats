import 'package:epic_eats/screens/login_screen.dart';
import 'package:epic_eats/screens/register_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_reg_providers.g.dart';

@riverpod
class ScreenIndex extends _$ScreenIndex {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
} 

@riverpod
class HasJustRegistered extends _$HasJustRegistered {
  @override
  bool build() => false;

  void setHasJustRegistered(bool value) {
    state = value;
  }
}

@riverpod 
List<ConsumerWidget> screens(Ref ref) => [
      LoginScreen(),
      RegisterScreen(),
    ];
