import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food.dart';

final favoriteFoodProvider =
    StateNotifierProvider<FavoriteNotifier, List<Food>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<List<Food>> {
  FavoriteNotifier() : super([]);

  void toggleFavorite(Food food) {
    if (state.contains(food)) {
      state = state.where((fav) => fav != food).toList();
    } else {
      state = [...state, food];
    }
  }

  bool isFavorite(food) {
    return state.contains(food);
  }
}
