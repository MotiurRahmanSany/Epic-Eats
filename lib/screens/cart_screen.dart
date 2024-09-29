import 'package:epic_eats/components/cart_item_tile.dart';
import 'package:epic_eats/components/cart_screen_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/empty_cart.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  void clearTheCart(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: const Text('Are you sure you want to clear the cart?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              ref.read(cartStateProvider.notifier).clearCart();
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('My Cart'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: () {
                if (ref.read(cartStateProvider).isEmpty) return;
                clearTheCart(context, ref);
              },
            ),
          ]),
      body: ref.watch(cartStateProvider).isEmpty
          ? const EmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ref.watch(cartStateProvider).length,
                    itemBuilder: (context, index) {
                      final cartItem = ref.watch(cartStateProvider)[index];
                      return CartItemTile(cartItem: cartItem);
                    },
                  ),
                ),

                // Cart Price and Check out 

                const CartScreenOverlay(),
              ],
            ),
    );
  }
}
