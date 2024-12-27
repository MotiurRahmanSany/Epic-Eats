import 'package:epic_eats/models/food.dart';
import 'package:epic_eats/providers/food_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_food_provider.g.dart';

@riverpod
class SearchFoodNotifier extends _$SearchFoodNotifier {
  @override
  List<Food> build() {
    return [];
  }

  void searchFood(String query) {
    if (query.isEmpty) {
      state = [];
      return;
    } else {
      final foodDatabase = ref.watch(foodDatabaseProvider);
      state = foodDatabase.where(
              (food) => food.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }  
}
