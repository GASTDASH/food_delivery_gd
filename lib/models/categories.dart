abstract class Categories {
  static List list = <Category>[
    Category(id: 1, name: "All", imgAsset: "assets/img/all_food.jpg"),
    Category(id: 2, name: "Hot Dog", imgAsset: "assets/img/hotdog.jpg"),
    Category(id: 3, name: "Burger", imgAsset: "assets/img/burger.jpg"),
    Category(id: 4, name: "Pizza", imgAsset: "assets/img/pizza.jpg"),
    Category(id: 5, name: "Chicken", imgAsset: "assets/img/chicken.png"),
    Category(id: 6, name: "Wings", imgAsset: "assets/img/wings.jpg"),
    Category(id: 7, name: "Rice", imgAsset: "assets/img/rice.png"),
    Category(id: 8, name: "Sandwich", imgAsset: "assets/img/sandwich.png"),
  ];
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.imgAsset,
  });

  final int id;
  final String name;
  final String imgAsset;
}
