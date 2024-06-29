abstract class Categories {
  static List list = <Category>[
    Category(name: "All", smallImgAsset: "assets/img/all_food.jpg"),
    Category(name: "Hot Dog", smallImgAsset: "assets/img/hotdog.jpg"),
    Category(name: "Burger", smallImgAsset: "assets/img/burger.jpg"),
    Category(name: "Pizza", smallImgAsset: "assets/img/pizza.jpg"),
    Category(name: "Chicken", smallImgAsset: "assets/img/chicken.png"),
    Category(name: "Wings", smallImgAsset: "assets/img/wings.jpg"),
    Category(name: "Rice", smallImgAsset: "assets/img/rice.png"),
    Category(name: "Sandwich", smallImgAsset: "assets/img/sandwich.png"),
  ];
}

class Category {
  Category({
    required this.name,
    required this.smallImgAsset,
  });
  final String name;
  final String smallImgAsset;
}
