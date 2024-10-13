import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../core/constants/hive_constants.dart';
import '../models/food.dart';

final favoriteFoodProvider =
    StateNotifierProvider<FavoriteNotifier, List<Food>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<List<Food>> {
  FavoriteNotifier() : super([]){
    _loadFavoritesFromDB();
  }

  void toggleFavorite(Food food) {
    final existingFood = state.firstWhereOrNull((fav) => fav.name == food.name);
  if (existingFood != null) {
    state = state.where((fav) => fav.name != food.name).toList();
    _removeFavoriteFromDB(food.name);
  } else {
      state = [...state, food];
      _saveFavoriteToDB(food);
    } 
  }

  bool isFavorite(food) {
    return state.contains(food);
  }

  void clearFavorites() {
    state = [];
    _clearFavoritesFromDB();
  }

  // ! Hive Operations for Favorites

  final favoritesBox = Hive.box<Food>(HiveConstants.favBoxName);

  void _loadFavoritesFromDB() {
    state = favoritesBox.values.toList();
  }

  void _saveFavoriteToDB(Food food) {
    favoritesBox.put(food.name, food);
  }

  void _removeFavoriteFromDB(String foodName) {
    favoritesBox.delete(foodName);
  }

  void _clearFavoritesFromDB() {
    favoritesBox.clear();
  }
}
