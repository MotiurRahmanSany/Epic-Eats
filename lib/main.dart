import 'package:epic_eats/providers/theme_provider.dart';
import 'package:epic_eats/screens/cart_screen.dart';
import 'package:epic_eats/screens/checkout_screen.dart';
import 'package:epic_eats/screens/delivery_progress_screen.dart';
import 'package:epic_eats/screens/favorite_screen.dart';
import 'package:epic_eats/screens/home_screen.dart';
import 'package:epic_eats/screens/login_register_screen.dart';
import 'package:epic_eats/screens/login_screen.dart';
import 'package:epic_eats/screens/order_history_screen.dart';
import 'package:epic_eats/screens/register_screen.dart';
import 'package:epic_eats/screens/settings_screen.dart';
import 'package:epic_eats/screens/track_order_screen.dart';
import 'package:epic_eats/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      theme: theme,
      home: const AuthGate(),
      routes: {
        '/login_register': (context) => const LoginRegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/cart': (context) => const CartScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/order_history': (conetxt) => const OrderHistoryScreen(),
        '/delivery_progress': (context) => const DeliveryProgressScreen(),
        '/track_order': (context) => const TrackOrderScreen(),
      },
    );
  }
}
