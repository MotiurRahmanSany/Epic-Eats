import 'package:epic_eats/models/food.dart';
import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 3)
class CartItem extends HiveObject {
  @HiveField(0)
  Food food;
  @HiveField(1)
  int quantity;
  @HiveField(2)
  List<Addon> selectedAddons;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice =>
      (food.price + selectedAddons.fold(0, (sum, addon) => sum + addon.price)) *
      quantity;
}
