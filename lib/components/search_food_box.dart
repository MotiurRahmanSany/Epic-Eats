import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFoodBox extends ConsumerStatefulWidget {
  const SearchFoodBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchFoodBoxState();
}

class _SearchFoodBoxState extends ConsumerState<SearchFoodBox> {
  final _searchFoodController = TextEditingController();
  final myBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(15),
  );
  @override
  void dispose() {
    _searchFoodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      // margin: EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          ),
      child: TextField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: _searchFoodController,
        decoration: InputDecoration(
          border: myBorder,
          focusedBorder: myBorder,
          enabledBorder: myBorder,
          hintText: 'Search delicious food..',
          prefixIcon: const Icon(Icons.search),
          fillColor:
              Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.1),
          filled: true,
        ),
      ),
    );
  }
}
