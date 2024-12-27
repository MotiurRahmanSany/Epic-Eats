import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../core/constants/hive_constants.dart';
import '../models/cart_item.dart';
import '../models/order.dart';

part 'order_history_provider.g.dart';

@riverpod 
class OrderHistoryNotifier extends _$OrderHistoryNotifier {

  @override 
  List<Order> build(){
    _loadOrderHistoryFromDB();
    return [];
  }

  static const _uuid = Uuid();

  void createOrder({
    required List<CartItem> items,
    required double totalAmount,
    required String userLocation,
  }) {
    final newOrder = Order(
      id: _uuid.v4().substring(0, 7).toString(),
      items: items,
      userLocation: userLocation,
      totalAmount: totalAmount,
      dateTime: DateTime.now(),
    );

    state = [...state, newOrder];

    _saveOrderToDB(newOrder);
  }

  List<Order> get orderhistory => state;

  void removeOrder(Order order) {
    state = state.where((o) => o != order).toList();
    _removeOrderFromDB(order.id);
  }

  void clearOrderHistory() {
    state = [];
    _clearOrderHistoryFromDB();
  }

  // ! Hive Operations for Order History

  final orderHistoryBox = Hive.box<Order>(HiveConstants.orderHistoryBoxName);

  void _loadOrderHistoryFromDB() {
    // Load order history from DB
    state = orderHistoryBox.values.toList();
  }

  void _saveOrderToDB(Order order) {
    // Save order to DB
    orderHistoryBox.put(order.id, order);
  }

  void _removeOrderFromDB(String orderId) {
    // Remove order from DB
    orderHistoryBox.delete(orderId);
  }

  void _clearOrderHistoryFromDB() {
    // Clear order history from DB
    orderHistoryBox.clear();
  }
}
