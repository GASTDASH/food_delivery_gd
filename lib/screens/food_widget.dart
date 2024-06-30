import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/cart.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/models/restaurants.dart';
import 'package:food_delivery_gd/screens/food_details_screen.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.restaurantId,
    required this.foodId,
    required this.cartBadgeUpdateCallback,
  });

  final int restaurantId;
  final int foodId;
  final Function cartBadgeUpdateCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetailsScreen(
                    restaurantId: restaurantId,
                    foodId: foodId,
                    cartBadgeUpdateCallback: cartBadgeUpdateCallback)));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 35.sp),
            width: 153.sp,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.sp),
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 15, color: Colors.black.withAlpha(30)),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 46.sp, left: 12.sp, right: 12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Restaurants.list[restaurantId].foodList[foodId].name,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.sp),
                  Text(
                    // Restaurants.list[widget.restaurantId].foodList[index].description
                    "No description",
                    style: TextStyle(
                        fontSize: 13.sp, color: const Color(0xFF646982)),
                  ),
                  SizedBox(height: 2.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$${(Restaurants.list[restaurantId].foodList[foodId].price as double).truncate()}",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30.sp,
                        width: 30.sp,
                        child: IconButton.filled(
                          padding: EdgeInsets.zero,
                          style: IconButton.styleFrom(
                              backgroundColor: ColorsMy.primary),
                          onPressed: () {
                            cart.addItem(
                              CartItem(
                                  food: Restaurants
                                      .list[restaurantId].foodList[foodId],
                                  count: 1),
                            );
                            cartBadgeUpdateCallback();
                          },
                          icon: const Icon(
                            Icons.add_rounded,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Hero(
                  tag: "foodImg$foodId",
                  child: Container(
                    height: 79.sp,
                    width: 114.sp,
                    decoration: BoxDecoration(
                      color: const Color(0xFF98a8b8),
                      borderRadius: BorderRadius.circular(15.sp),
                      image: DecorationImage(
                        image: AssetImage(Restaurants
                                .list[restaurantId].foodList[foodId].imgAsset ??
                            "assets/img/no_food.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
