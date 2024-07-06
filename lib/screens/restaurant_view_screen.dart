import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/logger.dart';
import 'package:food_delivery_gd/models/categories.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/models/food.dart';
import 'package:food_delivery_gd/models/ingredients.dart';
import 'package:food_delivery_gd/models/restaurants.dart';
import 'package:food_delivery_gd/supabase.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import 'food_widget.dart';

class RestaurantViewScreen extends StatefulWidget {
  const RestaurantViewScreen({
    super.key,
    required this.restaurant,
    required this.cartBadgeUpdateCallback,
    required this.categoriesList,
  });

  final Restaurant restaurant;
  final Function cartBadgeUpdateCallback;
  final List<Category> categoriesList;

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  bool _isGettingFoodList = false;

  List<Food> foodList = [];

  int selectedCategoryIndex = 0;

  Future<void> getFoods() async {
    setState(() {
      _isGettingFoodList = true;
    });

    loggerNoStack.i("Получение списка товаров");

    try {
      var res = await supabase
          .from("foods")
          .select("*")
          .eq("restaurant_id", widget.restaurant.id);

      for (var food in res) {
        foodList.add(
          Food(
            id: food["food_id"],
            name: food["name"],
            description: food["description"],
            category: widget.categoriesList.firstWhere(
              (element) => element.id == food["category_id"],
            ),
            ingredients: [ingredients[0]],
            price: food["price"].toDouble(),
            imgAsset: food["img_asset"],
            restaurantId: food["restaurant_id"],
          ),
        );
      }

      setState(() {
        _isGettingFoodList = false;
      });
    } catch (e) {
      logger.e(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => Future.wait([getFoods()]));
  }

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
                tag: "restImg${widget.restaurant.id}",
                child: Container(
                  height: 150.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xFF98a8b8),
                    borderRadius: BorderRadius.circular(32.sp),
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imgAsset),
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
                    widget.restaurant.name,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    widget.restaurant.description,
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
                            widget.restaurant.rating.toString(),
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
                            widget.restaurant.deliveryPrice == 0.0
                                ? "Free"
                                : widget.restaurant.deliveryPrice.toString(),
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
                            "${widget.restaurant.deliveryTime} min",
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
                itemCount: widget.restaurant.categories.length,
                itemBuilder: (context, index) {
                  List<String> categoriesNames = [];
                  for (Category category in widget.restaurant.categories) {
                    categoriesNames.add(category.name);
                  }

                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 24.sp : 7.sp,
                      right: index == widget.restaurant.categories.length - 1
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
                itemCount: _isGettingFoodList ? 2 : foodList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 165.sp,
                  crossAxisSpacing: 20.sp,
                  mainAxisSpacing: 20.sp,
                ),
                itemBuilder: (context, index) {
                  return _isGettingFoodList
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 35.sp),
                                width: 153.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  color: Colors.black,
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 79.sp,
                                      width: 114.sp,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF98a8b8),
                                        borderRadius:
                                            BorderRadius.circular(15.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : FoodWidget(
                          food: foodList[index],
                          cartBadgeUpdateCallback:
                              widget.cartBadgeUpdateCallback,
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
