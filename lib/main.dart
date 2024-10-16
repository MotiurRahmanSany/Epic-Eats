import 'package:epic_eats/core/constants/hive_constants.dart';
import 'package:epic_eats/models/cart_item.dart';
import 'package:epic_eats/models/food.dart';
import 'package:epic_eats/models/order.dart';
import 'package:epic_eats/providers/theme_provider.dart';
import 'package:epic_eats/screens/cart_screen.dart';
import 'package:epic_eats/screens/checkout_screen.dart';
import 'package:epic_eats/screens/favorite_screen.dart';
import 'package:epic_eats/screens/home_screen.dart';
import 'package:epic_eats/screens/login_register_screen.dart';
import 'package:epic_eats/screens/login_screen.dart';
import 'package:epic_eats/screens/order_history_screen.dart';
import 'package:epic_eats/screens/profile_screen.dart';
import 'package:epic_eats/screens/register_screen.dart';
import 'package:epic_eats/screens/search_food_screen.dart';
import 'package:epic_eats/screens/settings_screen.dart';
import 'package:epic_eats/screens/track_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive
  final appStoragePath = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.init(appStoragePath.path);

  // Register Adapters
  Hive.registerAdapter(FoodAdapter());
  Hive.registerAdapter(AddonAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(OrderAdapter());

  // Open Hive boxes
  await Hive.openBox<CartItem>(HiveConstants.cartBoxName);
  await Hive.openBox<Food>(HiveConstants.favBoxName);
  await Hive.openBox<Order>(HiveConstants.orderHistoryBoxName);
  await Hive.openBox<String>(HiveConstants.prefBoxName);

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
      home: const LoginRegisterScreen(),
      routes: {
        '/login_register': (context) => const LoginRegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/cart': (context) => const CartScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/order_history': (conetxt) => const OrderHistoryScreen(),
        '/track_order': (context) => const TrackOrderScreen(),
        '/search' : (context) => const SearchFoodScreen(),
      },
    );
  }
}
