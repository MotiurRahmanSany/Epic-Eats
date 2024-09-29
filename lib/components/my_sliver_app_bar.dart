import 'package:epic_eats/components/header_delivery_info.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../utils/category_enum.dart';

class MySliverAppBar extends StatelessWidget {
  final Function(int) onTabChange;
  final TabController tabController;
  final int cartLength;
  const MySliverAppBar({
    super.key,
    required this.onTabChange,
    required this.tabController,
    required this.cartLength
  });

  List<Tab> _buildCategoryTabs() {
    return Category.values.map((cat) {
      final category = cat.toString().split('.').last;
      final categoryItem = category[0].toUpperCase() + category.substring(1);
      return Tab(
        text: categoryItem,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      expandedHeight: 300,
      pinned: true,
      title: const Text('Sunset Dinner'),
      centerTitle: true,
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   onPressed: () {
          
      //   },
      // ),
      actions: [
        IconButton(
          icon: badges.Badge(
            badgeContent: Text('$cartLength'),
            position: badges.BadgePosition.topEnd(top: -12, end: -8),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        background: HeaderDeliveryInfo(),
      ),
      bottom: TabBar(
        controller: tabController,
        isScrollable: true,
        tabs: _buildCategoryTabs(),
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        onTap: onTabChange,
      ),
    );
  }
}
