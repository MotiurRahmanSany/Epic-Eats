import 'package:epic_eats/models/food.dart';

class CartItem {
  Food food;
  int quantity;
  List<Addon> selectedAddons;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice =>
      (food.price + selectedAddons.fold(0, (sum, addon) => sum + addon.price)) * quantity;
}
