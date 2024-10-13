import 'package:epic_eats/components/drawer_tile.dart';
import 'package:epic_eats/providers/favorite_provider.dart';
import 'package:epic_eats/providers/order_history_provider.dart';
import 'package:epic_eats/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  void logUserOut() async {
    final authService = AuthService();

    await authService.signUserOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Center(
                    child: Column(
                  children: [
                    Icon(
                      Icons.restaurant_outlined,
                      size: 100,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    Text(
                      'Epic Eats',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )),
              ),
               DrawerTile(
                title: 'My Profile',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icons.person_outline,
              ),
              DrawerTile(
                title: 'Favorites',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/favorite');
                },
                icon: Icons.favorite_rounded,
                itemCount: '${ref.watch(favoriteFoodProvider).length}',
              ),
              DrawerTile(
                title: 'Track Order',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/track_order');
                },
                icon: Icons.delivery_dining_outlined,
              ),
              DrawerTile(
                title: 'Order History',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/order_history');
                },
                icon: Icons.receipt_long_rounded,
                itemCount: '${ref.watch(orderHistoryProvider).length}',
              ),
              DrawerTile(
                title: 'Settings',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icons.settings,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DrawerTile(
              title: 'Logout',
              onTap: () {
                Navigator.pop(context);
                logUserOut();
              },
              icon: Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
