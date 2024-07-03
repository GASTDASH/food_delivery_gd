abstract class Categories {
  static List list = <Category>[
    Category(name: "All", imgAsset: "assets/img/all_food.jpg"),
    Category(name: "Hot Dog", imgAsset: "assets/img/hotdog.jpg"),
    Category(name: "Burger", imgAsset: "assets/img/burger.jpg"),
    Category(name: "Pizza", imgAsset: "assets/img/pizza.jpg"),
    Category(name: "Chicken", imgAsset: "assets/img/chicken.png"),
    Category(name: "Wings", imgAsset: "assets/img/wings.jpg"),
    Category(name: "Rice", imgAsset: "assets/img/rice.png"),
    Category(name: "Sandwich", imgAsset: "assets/img/sandwich.png"),
  ];
}

class Category {
  Category({
    required this.name,
    required this.imgAsset,
  });
  final String name;
  final String imgAsset;
}
