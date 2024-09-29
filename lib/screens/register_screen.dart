import 'package:epic_eats/components/my_button.dart';
import 'package:epic_eats/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/screen_provider.dart';
import '../components/my_textfield.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp(BuildContext context) async {
    final authService = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUserUp(
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
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Password didn\'t match'),
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
            MyTextfield(
              controller: emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 8),
            MyTextfield(
              controller: passwordController,
              hintText: 'Password',
            ),
            const SizedBox(height: 8),
            MyTextfield(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
            ),
            const SizedBox(height: 15),
            MyButton(
              onTap: () => signUp(context),
              buttonText: 'Register',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () =>
                      ref.read(screensIndexProvider.notifier).state = 0,
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
