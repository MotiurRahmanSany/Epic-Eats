import 'package:epic_eats/models/cart_item.dart';
import 'package:hive/hive.dart';

part 'order.g.dart';

@HiveType(typeId: 4)
class Order extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<CartItem> items;
  @HiveField(2)
  final double totalAmount;
  @HiveField(3)
  final String userLocation;
  @HiveField(4)
  final DateTime dateTime;

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.userLocation,
    required this.dateTime,
  });
}
