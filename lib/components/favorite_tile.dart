import 'package:flutter/material.dart';

import '../models/food.dart';

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({
    super.key,
    required this.food,
    required this.onTap,
  });
  final Food food;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: ListTile(
          leading: SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                food.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(food.name),
          subtitle: Text(
            '\$${food.price}',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
