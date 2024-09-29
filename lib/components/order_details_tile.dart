import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class OrderDetailsTile extends StatelessWidget {
  const OrderDetailsTile({super.key, required this.orderItem});
  final CartItem orderItem;

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            orderItem.food.name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price: \$${orderItem.food.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                orderItem.selectedAddons.isEmpty
                    ? 'No Addons were selected'
                    :
                'Addons: ${orderItem.selectedAddons.map((addon) => addon.name).join(', ')}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}