import 'package:collection/collection.dart';
import 'package:epic_eats/models/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../core/constants/hive_constants.dart';
import '../models/food.dart';

final cartStateProvider =
    StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]) {
    _loadCartFromDB();
  }
  final cartBox = Hive.box<CartItem>(HiveConstants.cartBoxName);

  double get subTotal =>
      state.fold(0, (sum, cartItem) => sum + cartItem.totalPrice);

  double get deliveryFee => subTotal > 120 ? subTotal * .07 : subTotal * .1;

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
    _saveCartItemToDB(cartItem);
  }

  void removeFromCart(CartItem cartItem) {
    final itemIndex = state.indexOf(cartItem);

    if (itemIndex != -1) {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
        state = [...state];
        _saveCartItemToDB(cartItem);
      } else {
        state = state.where((item) => item != cartItem).toList();
        _removeCartItemsFromDB(cartItem.food.name);
      }
    }
  }

  void clearCart() {
    state = [];
    _clearCartInDB();
  }

  //! Hive Database Operations

  void _loadCartFromDB() {
    // Load cart from local storage
    try {
      final savedCartItems = cartBox.values.toList().cast<CartItem>();
      if (savedCartItems.isNotEmpty) {
        state = savedCartItems;
      } else {
        state = [];
      }
    } catch (err) {
      print('Error loading cart from DB: $err');  
    }
  }

  void _saveCartItemToDB(CartItem cartItem) {
    // Save cart to local storage
    try {
     

      cartBox.put(cartItem.food.name, cartItem);
       
    } catch (err) {
      print('Error saving cart to DB: $err');
       
    }
  }

  void _removeCartItemsFromDB(String foodName) {
    // Remove cart from local storage
    cartBox.delete(foodName);
     
  }

  void _clearCartInDB() {
    // Clear cart from local storage
    cartBox.clear();
     
    
  }
}
