import 'package:food_delivery_gd/models/categories.dart';
import 'package:food_delivery_gd/models/food.dart';

abstract class Restaurants {
  static List list = <Restaurant>[
    Restaurant(
      name: "Rose Garden Restaurant",
      imgAsset: "assets/img/rest1.jpg",
      categories: [
        Categories.list.firstWhere((category) => category.name == "Burger"),
        Categories.list.firstWhere((category) => category.name == "Chicken"),
        Categories.list.firstWhere((category) => category.name == "Pizza"),
      ],
      rating: 4.7,
      deliveryPrice: 0,
      deliveryTime: 20,
      description:
          "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
      foodList: [
        Food(
          name: "Burger Ferguson",
          category: Categories.list
              .firstWhere((category) => category.name == "Burger"),
          ingredients: ["Salt", "Chicken"],
          price: 32,
          imgAsset: "assets/img/burger2.jpg",
        ),
        Food(
          name: "Burger Bistro",
          category: Categories.list
              .firstWhere((category) => category.name == "Burger"),
          ingredients: ["Salt", "Chicken"],
          price: 40,
          imgAsset: "assets/img/burger3.jpg",
        ),
        Food(
          name: "Prosto Burger",
          category: Categories.list
              .firstWhere((category) => category.name == "Burger"),
          ingredients: ["Salt"],
          price: 20,
          imgAsset: "assets/img/burger1.jpg",
        ),
      ],
    ),
    Restaurant(
      name: "Savor's Haven",
      imgAsset: "assets/img/rest2.jpg",
      categories: [
        Categories.list.firstWhere((category) => category.name == "Burger"),
        Categories.list.firstWhere((category) => category.name == "Wings"),
        Categories.list.firstWhere((category) => category.name == "Pizza"),
      ],
      rating: 4.8,
      deliveryPrice: 0,
      deliveryTime: 10,
      description: "Test",
      foodList: [
        Food(
          name: "Prosto Burger",
          category: Categories.list
              .firstWhere((category) => category.name == "Burger"),
          ingredients: ["Salt"],
          price: 20,
        ),
      ],
    ),
    Restaurant(
      name: "The Culinary Canvas",
      imgAsset: "assets/img/rest3.jpg",
      categories: [
        Categories.list.firstWhere((category) => category.name == "Riche"),
        Categories.list.firstWhere((category) => category.name == "Sandwich"),
      ],
      rating: 4.4,
      deliveryPrice: 0,
      deliveryTime: 15,
      description: "Test",
      foodList: [
        Food(
          name: "Prosto Burger",
          category: Categories.list
              .firstWhere((category) => category.name == "Burger"),
          ingredients: ["Salt"],
          price: 20,
        ),
      ],
    ),
    Restaurant(
      name: "Bite Bistro",
      imgAsset: "assets/img/rest4.jpg",
      categories: [
        Categories.list.firstWhere((category) => category.name == "Chicken"),
        Categories.list.firstWhere((category) => category.name == "Wings"),
      ],
      rating: 4.2,
      deliveryPrice: 0,
      deliveryTime: 50,
      description: "Test",
      foodList: [
        Food(
          name: "Prosto Burger",
          category: Categories.list
              .firstWhere((category) => category.name == "Burger"),
          ingredients: ["Salt"],
          price: 20,
        ),
      ],
    ),
  ];
}

class Restaurant {
  Restaurant({
    required this.name,
    required this.imgAsset,
    required this.categories,
    required this.rating,
    required this.deliveryPrice,
    required this.deliveryTime,
    required this.description,
    required this.foodList,
  });
  final String name;
  final String imgAsset;
  final List<Category> categories;
  final List<Food> foodList;
  final double rating;
  final double deliveryPrice;
  final int deliveryTime;
  final String description;
}
