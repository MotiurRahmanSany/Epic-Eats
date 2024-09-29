import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderHistoryTile extends StatelessWidget {
  const OrderHistoryTile({
    super.key,
    required this.order,
    required this.onTap,
  });

  final Order order;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.jm().format(order.dateTime);

    /// prints
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.receipt_outlined),
          title: Text(
            'Order ID: #${order.id}',
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          subtitle: Text('Spent: \$${order.totalAmount.toStringAsFixed(2)}'),
          trailing: Text(formattedDate),
          onTap: onTap,
        ),
      ),
    );
  }
}
