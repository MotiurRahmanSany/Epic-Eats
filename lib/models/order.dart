import 'package:epic_eats/models/cart_item.dart';
import 'package:uuid/uuid.dart';

class Order {
  static const _uuid = Uuid();
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime dateTime;

  Order({
    required this.items,
    required this.totalAmount,
    required this.dateTime,
  }) : id = _uuid.v4();
}
