class PaymentMethod {
  PaymentMethod({
    required this.name,
    required this.iconAsset,
  });

  final String name;
  final String iconAsset;
}

List<PaymentMethod> paymantMethodsList = [
  PaymentMethod(
    name: "Cash",
    iconAsset: "assets/svg/icons/cash.svg",
  ),
  PaymentMethod(
    name: "Visa",
    iconAsset: "assets/svg/icons/visa.svg",
  ),
  PaymentMethod(
    name: "Mastercard",
    iconAsset: "assets/svg/icons/mastercard.svg",
  ),
  PaymentMethod(
    name: "PayPal",
    iconAsset: "assets/svg/icons/paypal.svg",
  ),
];
