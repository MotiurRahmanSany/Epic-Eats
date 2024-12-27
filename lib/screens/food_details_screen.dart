import 'package:epic_eats/components/my_button.dart';
import 'package:epic_eats/models/cart_item.dart';
import 'package:epic_eats/providers/cart_provider.dart';
import 'package:epic_eats/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food.dart';
import '../providers/addon_provider.dart';

class FoodDetailsScreen extends ConsumerStatefulWidget {
  const FoodDetailsScreen({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends ConsumerState<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedAddons = ref.watch(addonNotifierProvider);
    final favoriteFoods = ref.watch(favoriteFoodNotifierProvider);

    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: Image.asset(
                      widget.food.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${widget.food.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const Divider(),
                        const Text(
                          'Add-ons',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withOpacity(.12),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.food.addons.length,
                            itemBuilder: (context, index) {
                              final addonItem = widget.food.addons[index];
                              return CheckboxListTile(
                                value: selectedAddons.contains(addonItem),
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                title: Text(addonItem.name),
                                subtitle: Text(
                                  '\$ ${addonItem.price}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                onChanged: (value) {
                                  ref
                                      .read(addonNotifierProvider.notifier)
                                      .toggleAddon(addonItem);
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        MyButton(
                          onTap: () {
                            // Add to cart
                            ref.read(cartNotifierProvider.notifier).addToCart(
                                  CartItem(
                                    food: widget.food,
                                    selectedAddons: selectedAddons,
                                  ),
                                );
                            ref.read(addonNotifierProvider.notifier).clearAddons();

                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                content: Text('${widget.food.name} added!'),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            );
                          },
                          buttonText: 'Add To Cart',
                          icon: Icons.add_shopping_cart,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface.withOpacity(.55),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                ref.read(addonNotifierProvider.notifier).clearAddons();
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface.withOpacity(.55),
              ),
              child: IconButton(
                icon: Icon(
                  favoriteFoods.contains(widget.food)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: favoriteFoods.contains(widget.food)
                      ? Colors.red
                      : Colors.black,
                ),
                onPressed: () {
                  ref
                      .read(favoriteFoodNotifierProvider.notifier)
                      .toggleFavorite(widget.food);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
