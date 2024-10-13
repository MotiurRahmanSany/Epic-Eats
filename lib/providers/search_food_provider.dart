import 'package:epic_eats/models/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchFoodProvider =
    StateNotifierProvider<SearchFoodNotifier, List<Food>>((ref) {
  return SearchFoodNotifier();
});

class SearchFoodNotifier extends StateNotifier<List<Food>> {
  SearchFoodNotifier() : super([]);

  void searchFood(String query) {
    if (query.isEmpty) {
      state = [];
      return;
    }
  }
}
