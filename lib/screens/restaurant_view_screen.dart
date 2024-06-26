import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/colors.dart';
import 'package:food_delivery_gd/restaurants.dart';

class RestaurantViewScreen extends StatefulWidget {
  const RestaurantViewScreen({super.key, required this.restaurantId});

  final int restaurantId;

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Restaurant View",
          style: TextStyle(fontSize: 17.sp),
        ),
        actions: [
          IconButton.filled(
            color: Colors.white,
            style:
                IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 30.sp,
            ),
          ),
        ],
      ),
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
                    Restaurants.list[widget.restaurantId].foodList.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 24.sp : 7.sp,
                    right: index ==
                            Restaurants
                                    .list[widget.restaurantId].foodList.length -
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
                                Restaurants
                                    .list[widget.restaurantId].foodList[index],
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
                ),
              ),
            ),
            SizedBox(height: 32.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 165.sp,
                  crossAxisSpacing: 20.sp,
                  mainAxisSpacing: 20.sp,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35.sp),
                        width: 153.sp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 15,
                                color: Colors.black.withAlpha(30)),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 46.sp, left: 12.sp, right: 12.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Burger",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.sp),
                              Text(
                                "Figna kakaya-to",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF646982)),
                              ),
                            ],
                          ),
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
                                borderRadius: BorderRadius.circular(15.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
