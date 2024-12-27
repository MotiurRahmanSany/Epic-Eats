import 'package:epic_eats/components/favorite_tile.dart';
import 'package:epic_eats/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteFoods = ref.watch(favoriteFoodNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Foods'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: ref.watch(favoriteFoodNotifierProvider).isEmpty
          ? const Center(
              child: Text('No Favorites Yet'),
            )
          : ListView.builder(
            itemCount: favoriteFoods.length,
              itemBuilder: (context, index) {
                final food = favoriteFoods[index];
                return FavoriteTile(
                  food: food,
                  onTap: () {
                    ref
                        .read(favoriteFoodNotifierProvider.notifier)
                        .toggleFavorite(food);
                  },
                );
              },
            ),
    );
  }
}
