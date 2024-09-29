import 'package:collection/collection.dart';
import 'package:epic_eats/models/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food.dart';

final cartStateProvider =
    StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  double get subTotal =>
      state.fold(0, (sum, cartItem) => sum + cartItem.totalPrice);

  double get deliveryFee =>
      subTotal > 120 ? subTotal * .07 : subTotal * .1;

  double get totalPrice => subTotal + deliveryFee;

  bool _areAddonsEqual(List<Addon> a, List<Addon> b) {
    const equalityDeepChecking = DeepCollectionEquality.unordered();
    return equalityDeepChecking.equals(a, b);
  }

  void addToCart(CartItem cartItem) {
    final existingCartItem = state.firstWhereOrNull(
      (item) => (item.food.name == cartItem.food.name &&
          _areAddonsEqual(item.selectedAddons, cartItem.selectedAddons)),
    );

    if (existingCartItem != null) {
      cartItem.quantity++;
      state = [...state];
    } else {
      state = [...state, cartItem];
    }
  }

  void removeFromCart(CartItem cartItem) {
    final itemIndex = state.indexOf(cartItem);

    if (itemIndex != -1) {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
        state = [...state];
      } else {
        state = state.where((item) => item != cartItem).toList();
      }
    }
  }

  void clearCart() {
    state = [];
  }
}
