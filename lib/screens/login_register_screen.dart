import 'package:epic_eats/providers/login_reg_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRegisterScreen extends ConsumerWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = ref.watch(screensProvider);

    return screens[ref.watch(screenIndexProvider)];
  }
}
