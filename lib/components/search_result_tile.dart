import 'package:flutter/material.dart';

import '../models/food.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  final Food food;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final cat = food.category.toString().split('.').last;
    final category = cat[0].toUpperCase() + cat.substring(1);

    return Card(
      color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.2),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(food.image),
        ),
        title: Text(food.name),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('\$${food.price}'),
            Text('⭐ ${food.rating}'),
            Row(
              children: [
              Icon(Icons.category_outlined, size: 16),
              SizedBox(width: 6),
              Text(category),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
