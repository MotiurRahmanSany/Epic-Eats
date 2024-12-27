import 'package:epic_eats/components/cart_overlay_item.dart';
import 'package:epic_eats/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class CartScreenOverlay extends ConsumerWidget {
  const CartScreenOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Total Items
          CartOverlayItem(
            billName: 'Total Items',
            price: cartProvider.length.toString(),
          ),
          // Sub total
          CartOverlayItem(
            billName: 'Sub Total',
            price: '\$${cartNotifier.subTotal.toStringAsFixed(2)}',
          ),

          // Delivery Fee
          CartOverlayItem(
            billName: 'Delivery Fee',
            price: '\$${cartNotifier.deliveryFee.toStringAsFixed(2)}',
          ),

          // Total Price

          CartOverlayItem(
            billName: 'Total Price',
            price:
                '\$${cartNotifier.totalPrice.toStringAsFixed(2)}',
            isBold: true,
          ),

          const SizedBox(height: 8),
          // Checkout Button

          MyButton(
            onTap: () {
              // Navigate to the checkout screen
              Navigator.of(context).pushNamed('/checkout');
            },
            buttonText: 'Checkout',
            icon: Icons.shopping_cart_checkout_sharp,
          ),
        ],
      ),
    );
  }
}
