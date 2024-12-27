import 'package:epic_eats/screens/food_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/search_result_tile.dart';
import '../providers/search_food_provider.dart';

class SearchFoodScreen extends ConsumerStatefulWidget {
  const SearchFoodScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchFoodScreenState();
}

class _SearchFoodScreenState extends ConsumerState<SearchFoodScreen> {
  final _searchFoodQueryController = TextEditingController();
  final _focusNode = FocusNode();

  final myBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(15),
  );

  @override
  void dispose() {
    _focusNode.dispose();
    _searchFoodQueryController.dispose();
    _searchFoodQueryController.clear();
    FocusScope.of(context).unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchFoodResults = ref.watch(searchFoodNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
            searchFoodResults.clear();
          },
        ),
        title: const Text('Search Food'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  ),
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: _focusNode,
                  controller: _searchFoodQueryController,
                  decoration: InputDecoration(
                    border: myBorder,
                    focusedBorder: myBorder,
                    enabledBorder: myBorder,
                    hintText: 'Search Delicious Food..',
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withOpacity(.1),
                    filled: true,
                  ),
                  onChanged: (query) {
                    ref.read(searchFoodNotifierProvider.notifier).searchFood(query);
                  },
                ),
              ),
            ),
            if (_searchFoodQueryController.text.isNotEmpty) ...[
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  'Found ${searchFoodResults.length} Item(s)',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchFoodResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    final food = searchFoodResults[index];
                    return SearchResultTile(
                      food: food,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsScreen(food: food),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ] else
              const Expanded(
                child: Center(
                  child: Text(
                    'Search Food You Will Love to Eat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
