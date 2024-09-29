import 'package:epic_eats/components/order_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderDetailsScreen extends ConsumerWidget {
  const OrderDetailsScreen({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Order Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Order ID: #${order.id}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Amount: \$${order.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${DateFormat.yMMMd().add_jms().format(order.dateTime)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ordered Items:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return OrderDetailsTile(
                    orderItem: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
