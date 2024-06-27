abstract class Categories {
  static List list = <Category>[
    Category(name: "All", smallImgAsset: "assets/img/all_food.jpg"),
    Category(name: "Hot Dog", smallImgAsset: "assets/img/hotdog.jpg"),
    Category(name: "Burger", smallImgAsset: "assets/img/burger.jpg"),
    Category(name: "Pizza", smallImgAsset: "assets/img/pizza.jpg"),
    Category(name: "Chicken", smallImgAsset: "assets/img/pizza.jpg"),
    Category(name: "Wings", smallImgAsset: "assets/img/pizza.jpg"),
    Category(name: "Riche", smallImgAsset: "assets/img/pizza.jpg"),
    Category(name: "Sandwich", smallImgAsset: "assets/img/pizza.jpg"),
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
