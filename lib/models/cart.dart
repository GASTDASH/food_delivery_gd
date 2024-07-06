import 'package:food_delivery_gd/models/food.dart';

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

  void save() {}

  Future<Cart> load() async {
    return Cart();
  }
}

Cart cart = Cart();
