import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/categories.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/models/restaurants.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';

import 'food_widget.dart';

class RestaurantViewScreen extends StatefulWidget {
  const RestaurantViewScreen(
      {super.key,
      required this.restaurantId,
      required this.cartBadgeUpdateCallback});

  final int restaurantId;
  final Function cartBadgeUpdateCallback;

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Hero(
                tag: "restImg${widget.restaurantId}",
                child: Container(
                  height: 150.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xFF98a8b8),
                    borderRadius: BorderRadius.circular(32.sp),
                    image: DecorationImage(
                      image: AssetImage(
                          Restaurants.list[widget.restaurantId].imgAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Restaurants.list[widget.restaurantId].name,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    Restaurants.list[widget.restaurantId].description,
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
            SizedBox(height: 31.sp),
            SizedBox(
              height: 46.sp,
              width: 375.sp,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    Restaurants.list[widget.restaurantId].categories.length,
                itemBuilder: (context, index) {
                  List<String> categoriesNames = [];
                  for (Category category
                      in Restaurants.list[widget.restaurantId].categories) {
                    categoriesNames.add(category.name);
                  }

                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 24.sp : 7.sp,
                      right: index ==
                              Restaurants.list[widget.restaurantId].categories
                                      .length -
                                  1
                          ? 24.sp
                          : 2.sp,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedCategoryIndex == index
                              ? const Color(0xFFf58d1d)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(39.sp),
                          border: selectedCategoryIndex != index
                              ? Border.all(
                                  width: 2.sp,
                                  color: const Color(0xFFededed),
                                )
                              : const Border(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.sp),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: Row(
                              children: [
                                Text(
                                  categoriesNames[index],
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: selectedCategoryIndex == index
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32.sp),
            Padding(
              padding:
                  EdgeInsets.only(left: 24.sp, right: 24.sp, bottom: 30.sp),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    Restaurants.list[widget.restaurantId].foodList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 165.sp,
                  crossAxisSpacing: 20.sp,
                  mainAxisSpacing: 20.sp,
                ),
                itemBuilder: (context, index) {
                  return FoodWidget(
                    restaurantId: widget.restaurantId,
                    foodId: index,
                    cartBadgeUpdateCallback: widget.cartBadgeUpdateCallback,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return CustomAppBar(
      title: "Restaurant View",
      backgroundColor: Colors.white,
      buttonBackgroundColor: const Color(0xFFecf0f4),
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
    // return AppBar(
    //   toolbarHeight: 60.sp,
    //   backgroundColor: Colors.white,
    //   surfaceTintColor: Colors.white,
    //   leading: IconButton.filled(
    //     color: Colors.white,
    //     style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //     icon: Icon(
    //       Icons.chevron_left,
    //       color: Colors.black,
    //       size: 30.sp,
    //     ),
    //   ),
    //   title: Text(
    //     "Restaurant View",
    //     style: TextStyle(fontSize: 17.sp),
    //   ),
    //   actions: [
    //     IconButton.filled(
    //       color: Colors.white,
    //       style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
    //       onPressed: () {},
    //       icon: Icon(
    //         Icons.more_horiz,
    //         color: Colors.black,
    //         size: 30.sp,
    //       ),
    //     ),
    //   ],
    // );
  }
}
