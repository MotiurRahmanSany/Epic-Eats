// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: 0)
class Food extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final double rating;
  @HiveField(5)
  final Category category;
  @HiveField(6)
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


  // Equality based on name only
  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}




@HiveType(typeId: 1)
class Addon extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
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

}

@HiveType(typeId: 2)
enum Category {
  @HiveField(0)
  burger,
  @HiveField(1)
  pizza,
  @HiveField(2)
  pasta,
  @HiveField(3)
  salad,
  @HiveField(4)
  sides,
  @HiveField(5)
  desserts,
  @HiveField(6)
  drinks,
  @HiveField(7)
  shushi
}

int get categoryLength => Category.values.length;
