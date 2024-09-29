import 'dart:convert';

import '../utils/category_enum.dart';

class Food {
  final String name;
  final String description;
  final double price;
  final String image;
  final double rating;
  final Category category;
  final List<Addon> addons;

  Food({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.category,
    this.addons = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'rating': rating,
      'category': category.toString().split('.').last,
      'addons': addons.map((x) => x.toMap()).toList(),
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
      rating: map['rating'] as double,
      category: Category.values
          .firstWhere((e) => e.toString() == 'Category.${map['category']}'),
      addons: List<Addon>.from(
        (map['addons'] as List<Map<String, dynamic>>).map<Addon>(
          (x) => Addon.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Addon {
  final String name;
  final double price;
  Addon({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
    };
  }

  factory Addon.fromMap(Map<String, dynamic> map) {
    return Addon(
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Addon.fromJson(String source) =>
      Addon.fromMap(json.decode(source) as Map<String, dynamic>);
}
