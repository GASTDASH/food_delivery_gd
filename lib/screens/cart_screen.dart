import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/cart.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/screens/payment_screen.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.cartBadgeUpdateCallback});

  final Function cartBadgeUpdateCallback;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController addressController = TextEditingController();
  double totalValue = 0;
  bool hasCard = false;

  @override
  void initState() {
    super.initState();

    // ignore: no_leading_underscores_for_local_identifiers
    double _totalValue = 0;
    for (CartItem cartItem in cart.items) {
      _totalValue += cartItem.food.price * cartItem.count;
    }
    totalValue = _totalValue;
  }

  void updateTotalValue() {
    setState(() {
      // ignore: no_leading_underscores_for_local_identifiers
      double _totalValue = 0;
      for (CartItem cartItem in cart.items) {
        _totalValue += cartItem.food.price * cartItem.count;
      }
      totalValue = _totalValue;
    });

    widget.cartBadgeUpdateCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121223),
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.sp),
            SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    cartItem: cart.items[index],
                    onPriceChanged: updateTotalValue,
                    cartItemIndex: index,
                  );
                },
              ),
            ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 310.sp,
        width: 375.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.sp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DELIVERY ADDRESS",
                    style: TextStyle(
                        color: const Color(0xFFa0a5ba), fontSize: 14.sp),
                  ),
                  Text(
                    "EDIT",
                    style: TextStyle(
                      color: ColorsMy.primary,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorsMy.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              TextBox(
                hintText: "",
                text: "2118 Thornridge Cir. Syracuse",
                controller: addressController,
              ),
              SizedBox(height: 30.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "TOTAL:",
                        style: TextStyle(
                            color: const Color(0xFFa0a5ba), fontSize: 14.sp),
                      ),
                      SizedBox(width: 10.sp),
                      Text(
                        "\$$totalValue",
                        style: TextStyle(
                            color: const Color(0xFF181C2E), fontSize: 30.sp),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Breakdown",
                        style:
                            TextStyle(color: ColorsMy.primary, fontSize: 14.sp),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 26.sp),
              GestureDetector(
                onTap: cart.items.isNotEmpty
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentScreen(totalValue: totalValue)));
                      }
                    : () {},
                child: Container(
                  height: 62.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                      color: cart.items.isNotEmpty
                          ? ColorsMy.primary
                          : Theme.of(context).disabledColor,
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Center(
                    child: Text(
                      "PLACE ORDER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    // return AppBar(
    //   toolbarHeight: 60.sp,
    //   backgroundColor: const Color(0xFF121223),
    //   surfaceTintColor: const Color(0xFF121223),
    //   leading: IconButton.filled(
    //     color: Colors.white,
    //     style: IconButton.styleFrom(backgroundColor: const Color(0xFF292939)),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //     icon: Icon(
    //       Icons.chevron_left,
    //       color: Colors.white,
    //       size: 30.sp,
    //     ),
    //   ),
    //   title: Text(
    //     "Cart",
    //     style: TextStyle(fontSize: 17.sp, color: Colors.white),
    //   ),
    //   // actions: [
    //   //   GestureDetector(
    //   //     onTap: () {},
    //   //     child: Text(
    //   //       "DONE",
    //   //       style: TextStyle(
    //   //         color: ColorsMy.success,
    //   //         fontSize: 14.sp,
    //   //         decoration: TextDecoration.underline,
    //   //         decorationColor: ColorsMy.success,
    //   //       ),
    //   //     ),
    //   //   )
    //   // ],
    // );
    return CustomAppBar(
      title: "Cart",
      backgroundColor: const Color(0xFF121223),
      buttonBackgroundColor: const Color(0xFF292939),
      iconColor: Colors.white,
      textColor: Colors.white,
    );
  }
}
