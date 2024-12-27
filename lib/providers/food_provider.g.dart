// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodDatabaseHash() => r'a74e5e4673403e2c3b6377dfda3667a9867a4bc9';

/// See also [foodDatabase].
@ProviderFor(foodDatabase)
final foodDatabaseProvider = AutoDisposeProvider<List<Food>>.internal(
  foodDatabase,
  name: r'foodDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$foodDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FoodDatabaseRef = AutoDisposeProviderRef<List<Food>>;
String _$filteredFoodHash() => r'6d4f4791daec55cd37d3ed68da4280418ac7f66d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FilteredFood extends BuildlessAutoDisposeNotifier<List<Food>> {
  late final Category category;

  List<Food> build(
    Category category,
  );
}

/// See also [FilteredFood].
@ProviderFor(FilteredFood)
const filteredFoodProvider = FilteredFoodFamily();

/// See also [FilteredFood].
class FilteredFoodFamily extends Family<List<Food>> {
  /// See also [FilteredFood].
  const FilteredFoodFamily();

  /// See also [FilteredFood].
  FilteredFoodProvider call(
    Category category,
  ) {
    return FilteredFoodProvider(
      category,
    );
  }

  @override
  FilteredFoodProvider getProviderOverride(
    covariant FilteredFoodProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredFoodProvider';
}

/// See also [FilteredFood].
class FilteredFoodProvider
    extends AutoDisposeNotifierProviderImpl<FilteredFood, List<Food>> {
  /// See also [FilteredFood].
  FilteredFoodProvider(
    Category category,
  ) : this._internal(
          () => FilteredFood()..category = category,
          from: filteredFoodProvider,
          name: r'filteredFoodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredFoodHash,
          dependencies: FilteredFoodFamily._dependencies,
          allTransitiveDependencies:
              FilteredFoodFamily._allTransitiveDependencies,
          category: category,
        );

  FilteredFoodProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final Category category;

  @override
  List<Food> runNotifierBuild(
    covariant FilteredFood notifier,
  ) {
    return notifier.build(
      category,
    );
  }

  @override
  Override overrideWith(FilteredFood Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredFoodProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FilteredFood, List<Food>> createElement() {
    return _FilteredFoodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredFoodProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredFoodRef on AutoDisposeNotifierProviderRef<List<Food>> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _FilteredFoodProviderElement
    extends AutoDisposeNotifierProviderElement<FilteredFood, List<Food>>
    with FilteredFoodRef {
  _FilteredFoodProviderElement(super.provider);

  @override
  Category get category => (origin as FilteredFoodProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
