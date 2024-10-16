import 'package:epic_eats/models/food.dart';
import 'package:epic_eats/providers/food_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchFoodProvider =
    StateNotifierProvider<SearchFoodNotifier, List<Food>>((ref) {
  return SearchFoodNotifier(ref.read(foodDatabaseProvider));
});

class SearchFoodNotifier extends StateNotifier<List<Food>> {
  final List<Food> foodDatabase;

  SearchFoodNotifier(this.foodDatabase) : super([]);

  void searchFood(String query) {
    if (query.isEmpty) {
      state = [];
      return;
    } else {
      state = foodDatabase
          .where(
              (food) => food.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
