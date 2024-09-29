import 'package:epic_eats/components/cart_item_quantity_selector.dart';
import 'package:epic_eats/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart_item.dart';

class CartItemTile extends ConsumerWidget {
  const CartItemTile({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.35),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  cartItem.food.image,
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    '\$${cartItem.food.price}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  CartItemQuantitySelector(
                    decrement: () => ref
                        .read(cartStateProvider.notifier)
                        .removeFromCart(cartItem),
                    increment: () => ref
                        .read(cartStateProvider.notifier)
                        .addToCart(cartItem),
                    quantity: cartItem.quantity,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: cartItem.selectedAddons.isNotEmpty ? 45 : 0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cartItem.selectedAddons.length,
              itemBuilder: (context, index) {
                final addon = cartItem.selectedAddons[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: FilterChip(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(0),
                    label: Text(
                      '${addon.name} (\$${addon.price})',
                    ),
                    onSelected: null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
