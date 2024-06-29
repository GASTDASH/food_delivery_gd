import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/cart.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/models/restaurants.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen(
      {super.key,
      required this.restaurantId,
      required this.foodId,
      required this.cartBadgeUpdateCallback});

  final int restaurantId;
  final int foodId;
  final Function cartBadgeUpdateCallback;

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int foodCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Hero(
                tag: "foodImg${widget.foodId}",
                child: Container(
                  height: 184.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xFF98a8b8),
                    borderRadius: BorderRadius.circular(32.sp),
                    image: DecorationImage(
                      image: AssetImage(Restaurants.list[widget.restaurantId]
                              .foodList[widget.foodId].imgAsset ??
                          "assets/img/no_food.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 37.sp / 2,
                            backgroundColor: Colors.white54,
                            child: SvgPicture.asset(
                              "assets/svg/icons/heart.svg",
                              color: Colors.white,
                              height: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: FittedBox(
                child: Container(
                  height: 47.sp,
                  padding: EdgeInsets.symmetric(horizontal: 24.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFe9e9e9), width: 1.sp),
                  ),
                  child: Center(
                    child: Text(
                      Restaurants.list[widget.restaurantId].name,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Restaurants
                        .list[widget.restaurantId].foodList[widget.foodId].name,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    Restaurants.list[widget.restaurantId]
                            .foodList[widget.foodId].description ??
                        "No description",
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0xFFa0a5ba)),
                  ),
                  SizedBox(height: 21.sp),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: ColorsMy.primary,
                            size: 30,
                          ),
                          SizedBox(width: 4.sp),
                          Text(
                            Restaurants.list[widget.restaurantId].rating
                                .toString(),
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(width: 24.sp),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delivery_dining_outlined,
                            color: ColorsMy.primary,
                            size: 30,
                          ),
                          SizedBox(width: 4.sp),
                          Text(
                            Restaurants.list[widget.restaurantId]
                                        .deliveryPrice ==
                                    0.0
                                ? "Free"
                                : Restaurants
                                    .list[widget.restaurantId].deliveryPrice
                                    .toString(),
                            style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      ),
                      SizedBox(width: 24.sp),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: ColorsMy.primary,
                            size: 30,
                          ),
                          SizedBox(width: 4.sp),
                          Text(
                            "${Restaurants.list[widget.restaurantId].deliveryTime} min",
                            style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.sp),
            Restaurants.list[widget.restaurantId].foodList[widget.foodId]
                        .sizes !=
                    null
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("SIZE:", style: TextStyle(fontSize: 13.sp)),
                            SizedBox(width: 16.sp),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24.sp,
                                  backgroundColor: const Color(0xFFf0f5fa),
                                  child: Text("10''",
                                      style: TextStyle(fontSize: 16.sp)),
                                ),
                                SizedBox(width: 10.sp),
                                CircleAvatar(
                                  radius: 24.sp,
                                  backgroundColor: const Color(0xFFf0f5fa),
                                  child: Text("14''",
                                      style: TextStyle(fontSize: 16.sp)),
                                ),
                                SizedBox(width: 10.sp),
                                CircleAvatar(
                                  radius: 24.sp,
                                  backgroundColor: const Color(0xFFf0f5fa),
                                  child: Text("16''",
                                      style: TextStyle(fontSize: 16.sp)),
                                ),
                                SizedBox(width: 10.sp),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.sp),
                    ],
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("INGRIDIENTS", style: TextStyle(fontSize: 13.sp)),
                  SizedBox(height: 20.sp),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisExtent: 84.sp,
                      crossAxisSpacing: 20.sp,
                      mainAxisSpacing: 20.sp,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Restaurants.list[widget.restaurantId]
                        .foodList[widget.foodId].ingredients.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 25.sp,
                            backgroundColor: const Color(0xFFffebe4),
                            child: SvgPicture.asset(
                              Restaurants
                                  .list[widget.restaurantId]
                                  .foodList[widget.foodId]
                                  .ingredients[index]
                                  .iconAsset,
                              height: 25.sp,
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Text(
                            Restaurants
                                .list[widget.restaurantId]
                                .foodList[widget.foodId]
                                .ingredients[index]
                                .name,
                            style: TextStyle(
                                color: const Color(0xFF747783),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 10.sp),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 184.sp,
        width: 184.sp,
        decoration: BoxDecoration(
          color: const Color(0xFFf0f5fa),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.sp)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$${((Restaurants.list[widget.restaurantId].foodList[widget.foodId].price) as double).truncate()}",
                    style: TextStyle(fontSize: 28.sp),
                  ),
                  Container(
                    height: 48.sp,
                    width: 125.sp,
                    decoration: BoxDecoration(
                      color: const Color(0xFF121233),
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                foodCount > 1 ? foodCount-- : {};
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFF41414f),
                              radius: 12.sp,
                              child: SvgPicture.asset(
                                "assets/svg/icons/minus.svg",
                                color: Colors.white,
                                width: 15.sp,
                              ),
                            ),
                          ),
                          Text(
                            foodCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                foodCount < 10 ? foodCount++ : {};
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFF41414f),
                              radius: 12.sp,
                              child: SvgPicture.asset(
                                "assets/svg/icons/plus.svg",
                                color: Colors.white,
                                width: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.sp),
              GestureDetector(
                onTap: () {
                  cart.add(
                    CartItem(
                        food: Restaurants
                            .list[widget.restaurantId].foodList[widget.foodId],
                        count: foodCount),
                  );
                  widget.cartBadgeUpdateCallback();
                  Navigator.pop(context);
                },
                child: Container(
                  height: 62.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                    color: ColorsMy.primary,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Center(
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
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

  AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.sp,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: IconButton.filled(
        color: Colors.white,
        style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30.sp,
        ),
      ),
      title: Text(
        "Details",
        style: TextStyle(fontSize: 17.sp),
      ),
      actions: [
        IconButton.filled(
          color: Colors.white,
          style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
