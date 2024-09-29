import 'package:epic_eats/providers/screen_provider.dart';
import 'package:epic_eats/screens/home_screen.dart';
import 'package:epic_eats/components/my_button.dart';
import 'package:epic_eats/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth/auth_service.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signUserIn(
          emailController.text, passwordController.text);
    } catch (err) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(err.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_open_outlined,
              size: 100,
            ),
            const SizedBox(height: 30),
            MyTextfield(controller: emailController, hintText: 'Email'),
            const SizedBox(height: 8),
            MyTextfield(controller: passwordController, hintText: 'Password'),
            const SizedBox(height: 15),
            MyButton(
              onTap: () => signIn(context),
              buttonText: 'Login',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () =>
                      ref.read(screensIndexProvider.notifier).state = 1,
                  child: const Text('Register Now'),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Text('Use as Guest',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
