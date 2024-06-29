import 'package:food_delivery_gd/models/food.dart';
import 'package:food_delivery_gd/models/restaurants.dart';

// class Cart {
//   Cart({
//     required this.restaurantId,
//     required this.cart,
//   });

//   final int restaurantId;
//   final List<Food> cart;
// }

// Cart cart = Cart(restaurantId: )

// List<Food> cart = [];

class CartItem {
  CartItem({
    required this.food,
    required this.count,
    this.size,
  });

  final Food food;
  int count;
  final String? size;
}

List<CartItem> cart = [
  CartItem(
    food: (Restaurants.list[0] as Restaurant).foodList[0],
    count: 1,
  ),
  CartItem(
    food: (Restaurants.list[0] as Restaurant).foodList[1],
    count: 2,
  ),
  CartItem(
    food: (Restaurants.list[0] as Restaurant).foodList[2],
    count: 3,
  ),
  CartItem(
    food: (Restaurants.list[1] as Restaurant).foodList[0],
    count: 1,
  ),
];
