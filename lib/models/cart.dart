import 'package:food_delivery_gd/models/food.dart';

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

class Cart {
  Cart();

  final List<CartItem> items = <CartItem>[];

  void addItem(CartItem cartItem) {
    bool alreadyHas = false;
    for (CartItem item in items) {
      if (item.food == cartItem.food) {
        alreadyHas = true;
        item.count++;
      }
    }
    if (!alreadyHas) {
      items.add(cartItem);
    }
  }

  void removeItem(Food food) {
    items.removeWhere((cartItem) => cartItem.food == food);
  }
}

Cart cart = Cart();

// List<CartItem> cart = [
//   // CartItem(
//   //   food: (Restaurants.list[0] as Restaurant).foodList[0],
//   //   count: 1,
//   // ),
//   // CartItem(
//   //   food: (Restaurants.list[0] as Restaurant).foodList[1],
//   //   count: 2,
//   // ),
//   // CartItem(
//   //   food: (Restaurants.list[0] as Restaurant).foodList[2],
//   //   count: 3,
//   // ),
//   // CartItem(
//   //   food: (Restaurants.list[1] as Restaurant).foodList[0],
//   //   count: 1,
//   // ),
// ];
