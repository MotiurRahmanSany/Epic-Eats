import 'package:flutter/material.dart';

class CartItemQuantitySelector extends StatelessWidget {
  const CartItemQuantitySelector({
    super.key,
    required this.quantity,
    required this.increment,
    required this.decrement,
  });
  final int quantity;
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: decrement,
            child: const Icon(
              Icons.remove,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 20,
              child: Center(child: Text('$quantity')),
            ),
          ),
          GestureDetector(
            onTap: increment,
            child: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
