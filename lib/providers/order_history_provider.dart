import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart_item.dart';
import '../models/order.dart';

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, List<Order>>((ref) {
  return OrderHistoryNotifier();
});

class OrderHistoryNotifier extends StateNotifier<List<Order>> {
  OrderHistoryNotifier() : super([]);

  void createOrder(List<CartItem> items, double totalAmount) {
    final newOrder = Order(
      items: items,
      totalAmount: totalAmount,
      dateTime: DateTime.now(),
    );

    state = [...state, newOrder];
  }

  List<Order> get orderhistory => state;
}
