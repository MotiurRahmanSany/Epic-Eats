import 'package:epic_eats/providers/cart_provider.dart';
import 'package:epic_eats/providers/food_provider.dart';
import 'package:epic_eats/providers/selected_tab_provider.dart';
import 'package:epic_eats/screens/food_details_screen.dart';
import 'package:epic_eats/components/my_food_tile.dart';
import 'package:epic_eats/components/my_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/my_drawer.dart';
import '../models/food.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categoryLength, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(selectedTabProvider.notifier).setIndex(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final selectedTab = ref.watch(selectedTabProvider);

    return DefaultTabController(
      length: categoryLength,
      child: Scaffold(
          drawer: const MyDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                MySliverAppBar(
                  onTabChange: (index) {
                    ref.read(selectedTabProvider.notifier).setIndex(index);
                  },
                  tabController: _tabController,
                  cartLength: ref.watch(cartNotifierProvider).length,
                ),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: Category.values.map((category) {
                      final foodList =
                          ref.watch(filteredFoodProvider(category));
                      if (foodList.isEmpty) {
                        return const Center(
                          child: Text('No Items available in this category'),
                        );
                      }
                      return ListView.builder(
                        itemCount: foodList.length,
                        itemBuilder: (context, index) {
                          final food = foodList[index];
                          return MyFoodTile(
                            food: food,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return FoodDetailsScreen(food: food);
                              }),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
