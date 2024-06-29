class Ingredient {
  Ingredient({
    required this.name,
    this.iconAsset,
    required this.alergic,
  });

  final String name;
  final String? iconAsset;
  final bool alergic;
}

List<Ingredient> ingredients = [
  Ingredient(
    name: "Salt",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: false,
  ),
  Ingredient(
    name: "Chicken",
    iconAsset: "assets/svg/icons/chicken.svg",
    alergic: false,
  ),
  Ingredient(
    name: "Onion",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: true,
  ),
  Ingredient(
    name: "Garlic",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: false,
  ),
  Ingredient(
    name: "Peppers",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: true,
  ),
  Ingredient(
    name: "Ginger",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: false,
  ),
  Ingredient(
    name: "Broccoli",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: false,
  ),
  Ingredient(
    name: "Orange",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: false,
  ),
  Ingredient(
    name: "Walnut",
    iconAsset: "assets/svg/icons/salt.svg",
    alergic: false,
  ),
];
