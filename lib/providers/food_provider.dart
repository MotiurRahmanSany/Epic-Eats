import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/food_warehouse.dart';
import '../models/food.dart';

// final foodDatabaseProvider = Provider<List<Food>>((ref) {
//   // return foodWarehouse.map((food) => Food.fromMap(food)).toList();

// });
final foodDatabaseProvider = Provider<List<Food>>((ref) {
  return foodWarehouse.expand((food) {
    Category category = Category.values.firstWhere(
      (foodItem) => foodItem.toString() == 'Category.${food['category']}',
    );

    return (food['foods'] as List).map((foodMap) {
      final foodWithCategory = {
        ...foodMap as Map<String, dynamic>,
        'category': category.toString().split('.').last,
      };

      return Food.fromMap(foodWithCategory);
    });
  }).toList();
});

final filteredFoodProvider =
    StateProvider.family<List<Food>, Category>((ref, category) {
  final foodDatabase = ref.watch(foodDatabaseProvider);

  return foodDatabase.where((food) => food.category == category).toList();
});
