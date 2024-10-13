// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final int typeId = 0;

  @override
  Food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Food(
      name: fields[0] as String,
      description: fields[1] as String,
      price: fields[2] as double,
      image: fields[3] as String,
      rating: fields[4] as double,
      category: fields[5] as Category,
      addons: (fields[6] as List).cast<Addon>(),
    );
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.addons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddonAdapter extends TypeAdapter<Addon> {
  @override
  final int typeId = 1;

  @override
  Addon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addon(
      name: fields[0] as String,
      price: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Addon obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.burger;
      case 1:
        return Category.pizza;
      case 2:
        return Category.pasta;
      case 3:
        return Category.salad;
      case 4:
        return Category.sides;
      case 5:
        return Category.desserts;
      case 6:
        return Category.drinks;
      case 7:
        return Category.shushi;
      default:
        return Category.burger;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.burger:
        writer.writeByte(0);
        break;
      case Category.pizza:
        writer.writeByte(1);
        break;
      case Category.pasta:
        writer.writeByte(2);
        break;
      case Category.salad:
        writer.writeByte(3);
        break;
      case Category.sides:
        writer.writeByte(4);
        break;
      case Category.desserts:
        writer.writeByte(5);
        break;
      case Category.drinks:
        writer.writeByte(6);
        break;
      case Category.shushi:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
