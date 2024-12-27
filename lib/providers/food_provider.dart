import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/food_warehouse.dart';
import '../models/food.dart';
part 'food_provider.g.dart';

@riverpod
List<Food> foodDatabase(Ref ref) {
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
}

@riverpod
class FilteredFood extends _$FilteredFood {
  @override
  List<Food> build(Category category) {
    final foodDatabase = ref.watch(foodDatabaseProvider);

    return foodDatabase.where((food) => food.category == category).toList();
  }
}
