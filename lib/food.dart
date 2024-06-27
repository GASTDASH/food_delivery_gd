import 'package:food_delivery_gd/categories.dart';

class Food {
  Food({
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
  final List<String> ingredients;
  final List<String>? sizes;
  final double price;
  final String? imgAsset;
}
