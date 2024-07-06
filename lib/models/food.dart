import 'package:food_delivery_gd/models/categories.dart';
import 'package:food_delivery_gd/models/ingredients.dart';

class FoodOld {
  FoodOld({
    required this.name,
    this.description,
    required this.category,
    required this.ingredients,
    this.sizes,
    required this.price,
    this.imgAsset,
  });

  final String name;
  final String? description;
  final Category category;
  final List<Ingredient> ingredients;
  final List<String>? sizes;
  final double price;
  final String? imgAsset;
}

class Food {
  Food({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    required this.ingredients,
    this.sizes,
    required this.price,
    this.imgAsset,
    required this.restaurantId,
  });

  final int id;
  final String name;
  final String? description;
  final Category category;
  final List<Ingredient> ingredients;
  final List<String>? sizes;
  final double price;
  final String? imgAsset;
  final int restaurantId;
}
