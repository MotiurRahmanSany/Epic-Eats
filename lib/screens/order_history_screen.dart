import 'package:epic_eats/components/no_past_orders.dart';
import 'package:epic_eats/components/order_tile.dart';
import 'package:epic_eats/providers/order_history_provider.dart';
import 'package:epic_eats/screens/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  void clearAllOrderHistories(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content:
            const Text('Are you sure you want to delete all order histories?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              ref.read(orderHistoryNotifierProvider.notifier).clearOrderHistory();
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
    final orderHistory = ref.watch(orderHistoryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Order History'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              if (orderHistory.isEmpty) return;
              clearAllOrderHistories(context, ref);
            },
          ),
        ],
      ),
      body: orderHistory.isEmpty
          ? const NoPastOrders()
          : ListView.builder(
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final order = orderHistory[index];
                return Dismissible(
                  key: ValueKey(order.id),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: Colors.red.withOpacity(.25),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    child: const Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                      size: 30,
                      
                    ),
                  ),
                  onDismissed: (direction) {
                    ref.read(orderHistoryNotifierProvider.notifier).removeOrder(order);
                  },
                  child: OrderHistoryTile(
                    order: order,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailsScreen(order: order),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
