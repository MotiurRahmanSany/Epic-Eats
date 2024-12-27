import 'package:epic_eats/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/login_reg_providers.dart';
import '../components/my_textfield.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _showSuccessDialog(BuildContext context, String message, WidgetRef ref) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, WidgetRef ref) async {
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      _showErrorDialog(context, 'Passwords do not matched');
      return;
    }
    try {
      final userCred =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ref.read(hasJustRegisteredProvider.notifier).setHasJustRegistered(true);
      ref.read(screenIndexProvider.notifier).setIndex(0);
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      _showSuccessDialog(
          context, 'You have successfully registered, please login now', ref);

      print(userCred);
    } on FirebaseAuthException catch (err) {
      _showErrorDialog(context, err.message ?? 'An error occurred');
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
              obscureText: true,
            ),
            const SizedBox(height: 8),
            MyTextfield(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(height: 15),
            MyButton(
              onTap: () async {
                await createUserWithEmailAndPassword(context, ref);
              },
              buttonText: 'Register',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () =>
                      ref.read(screenIndexProvider.notifier).setIndex(0),
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
