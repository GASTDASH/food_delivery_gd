abstract class Restaurants {
  static List list = <Restaurant>[
    Restaurant(
      name: "Rose Garden Restaurant",
      imgAsset: "assets/img/rest1.jpg",
      foodList: [
        "Burger",
        "Chiken",
        "Riche",
        "Wings",
      ],
      rating: 4.7,
      deliveryPrice: 0,
      deliveryTime: 20,
      description:
          "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
    ),
    Restaurant(
      name: "Savor's Haven",
      imgAsset: "assets/img/rest2.jpg",
      foodList: [
        "Burger",
        "Wings",
        "Pizza",
      ],
      rating: 4.8,
      deliveryPrice: 0,
      deliveryTime: 10,
      description: "Test",
    ),
    Restaurant(
      name: "The Culinary Canvas",
      imgAsset: "assets/img/rest3.jpg",
      foodList: [
        "Riche",
        "Sandwich",
      ],
      rating: 4.4,
      deliveryPrice: 0,
      deliveryTime: 15,
      description: "Test",
    ),
    Restaurant(
      name: "Bite Bistro",
      imgAsset: "assets/img/rest4.jpg",
      foodList: [
        "Chiken",
        "Wings",
      ],
      rating: 4.2,
      deliveryPrice: 0,
      deliveryTime: 50,
      description: "Test",
    ),
  ];
}

class Restaurant {
  Restaurant({
    required this.name,
    required this.imgAsset,
    required this.foodList,
    required this.rating,
    required this.deliveryPrice,
    required this.deliveryTime,
    required this.description,
  });
  final String name;
  final String imgAsset;
  // final List<Categories> categories = [
  //   Categories.list.firstWhere((category) => category.name == "Burger"),
  //   Categories.list.firstWhere((category) => category.name == "Chicken"),
  //   Categories.list.firstWhere((category) => category.name == "Burger"),
  // ];
  final List<String> foodList;
  final double rating;
  final double deliveryPrice;
  final int deliveryTime;
  final String description;
}
