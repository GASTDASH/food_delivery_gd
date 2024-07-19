import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/logger.dart';
import 'package:food_delivery_gd/models/cart.dart';
import 'package:food_delivery_gd/models/categories.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/models/restaurants.dart';
import 'package:food_delivery_gd/screens/cart_screen.dart';
import 'package:food_delivery_gd/screens/profile_screen.dart';
import 'package:food_delivery_gd/screens/restaurant_view_screen.dart';
import 'package:food_delivery_gd/supabase.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isGettingRestaurants = false;
  bool _isGettingCategories = false;

  List<Restaurant> restaurantList = [];
  List<Category> categoriesList = [];

  int selectedCategoryIndex = 0;

  void cartBadgeUpdateCallback() {
    setState(() {});
  }

  Future<void> getCategories() async {
    setState(() {
      _isGettingCategories = true;
    });

    loggerNoStack.i("Получение информации о категориях");

    try {
      var categories = await supabase.from("categories").select("*");

      categoriesList.clear();

      for (var category in categories) {
        categoriesList.add(
          Category(
            id: category["category_id"],
            name: category["name"],
            imgAsset: category["img_asset"],
          ),
        );
      }

      setState(() {
        _isGettingCategories = false;
      });
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> getRestaurants() async {
    setState(() {
      _isGettingRestaurants = true;
    });

    loggerNoStack.i("Получение информации о ресторанах");

    try {
      var restaurants = await supabase.from("restaurants").select("*");
      // print("restaurants = ");
      // print(restaurants);

      var restaurantsCategories = await supabase
          .from("restaurants-categories")
          .select("*, categories!inner(*)");
      // print("restaurantsCategories = ");
      // print(restaurantsCategories);

      restaurantList.clear();
      for (var restaurant in restaurants) {
        List<Category> tempCategories = [];

        for (var object in restaurantsCategories) {
          if (restaurant["restaurant_id"] == object["restaurant_id"]) {
            tempCategories.add(Category(
                id: object["categories"]["category_id"],
                name: object["categories"]["name"],
                imgAsset: object["categories"]["img_asset"]));
            // print("yes");
          }
        }

        restaurantList.add(
          Restaurant(
            id: restaurant["restaurant_id"],
            name: restaurant["name"],
            imgAsset: restaurant["img_asset"],
            categories: tempCategories,
            rating: restaurant["rating"],
            deliveryPrice: restaurant["delivery_price"].toDouble(),
            deliveryTime: restaurant["delivery_time"],
            description: restaurant["description"],
          ),
        );
      }

      setState(() {
        _isGettingRestaurants = false;
      });
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> update() async {
    Future.wait([
      getRestaurants(),
      getCategories(),
    ]);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => update());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await update();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 54.sp),
              topbar(),
              SizedBox(height: 24.sp),
              hello(),
              SizedBox(height: 16.sp),
              search(),
              SizedBox(height: 32.sp),
              categories(),
              SizedBox(height: 18.sp),
              restaurants(),
            ],
          ),
        ),
      ),
    );
  }

  Widget restaurants() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Open Restaurants",
                style: TextStyle(fontSize: 20.sp),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFFa0a5ba),
                    size: 27,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: SizedBox(
            width: 375.sp,
            child: _isGettingRestaurants
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.sp),
                        Container(
                          height: 137.sp,
                          width: 327.sp,
                          decoration: BoxDecoration(
                            color: const Color(0xFF98a8b8),
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                        SizedBox(height: 8.sp),
                        Container(
                          height: 20.sp,
                          width: 270.sp,
                          decoration: BoxDecoration(
                            color: const Color(0xFF98a8b8),
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                        ),
                        SizedBox(height: 8.sp),
                        Container(
                          height: 20.sp,
                          width: 200.sp,
                          decoration: BoxDecoration(
                            color: const Color(0xFF98a8b8),
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: restaurantList.length,
                    itemBuilder: (context, index) {
                      List<String> categoriesNames = [];
                      for (Category category
                          in restaurantList[index].categories) {
                        categoriesNames.add(category.name);
                      }

                      return (selectedCategoryIndex != 0 &&
                              !categoriesNames.contains(
                                categoriesList[selectedCategoryIndex].name,
                              ))
                          ? const SizedBox.shrink()
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestaurantViewScreen(
                                              restaurant: restaurantList[index],
                                              cartBadgeUpdateCallback:
                                                  cartBadgeUpdateCallback,
                                              categoriesList: categoriesList,
                                            )));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 28.sp),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: "restImg${restaurantList[index].id}",
                                      child: Container(
                                        height: 137.sp,
                                        width: 327.sp,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF98a8b8),
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  restaurantList[index]
                                                      .imgAsset),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    SizedBox(height: 8.sp),
                                    Text(
                                      restaurantList[index].name,
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                    SizedBox(height: 5.sp),
                                    Text(
                                      categoriesNames.join(" - "),
                                      style: TextStyle(
                                          color: const Color(0xFFa0a5ba),
                                          fontSize: 14.sp),
                                    ),
                                    SizedBox(height: 12.sp),
                                    Row(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              color: ColorsMy.primary,
                                              size: 30,
                                            ),
                                            SizedBox(width: 4.sp),
                                            Text(
                                              restaurantList[index]
                                                  .rating
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 24.sp),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.delivery_dining_outlined,
                                              color: ColorsMy.primary,
                                              size: 30,
                                            ),
                                            SizedBox(width: 4.sp),
                                            Text(
                                              restaurantList[index]
                                                          .deliveryPrice ==
                                                      0.0
                                                  ? "Free"
                                                  : restaurantList[index]
                                                      .deliveryPrice
                                                      .toString(),
                                              style: TextStyle(fontSize: 14.sp),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 24.sp),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.access_time_rounded,
                                              color: ColorsMy.primary,
                                              size: 30,
                                            ),
                                            SizedBox(width: 4.sp),
                                            Text(
                                              "${restaurantList[index].deliveryTime} min",
                                              style: TextStyle(fontSize: 14.sp),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
          ),
        )
      ],
    );
  }

  Widget topbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // showOfferDialog();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFecf0f4),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: SvgPicture.asset(
                      "assets/svg/icons/menu.svg",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 18.sp),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DELIVER TO",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsMy.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Halal Lab office",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 45.sp,
            width: 45.sp,
            child: Badge(
              largeSize: 16.sp,
              backgroundColor: ColorsMy.primary,
              offset: const Offset(-2, 0),
              label: Text(
                cart.items.length.toString(),
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              child: IconButton.filled(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartScreen(
                                cartBadgeUpdateCallback:
                                    cartBadgeUpdateCallback,
                              )));
                },
                icon: Padding(
                  padding: EdgeInsets.all(4.sp),
                  child: SvgPicture.asset("assets/svg/icons/shopping-bag.svg"),
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showOfferDialog() {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(39.sp),
        ),
        insetPadding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              height: 395.sp,
              width: 327.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(39.sp),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFe76f00),
                    Color(0xFFffeb34),
                  ],
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/img/cupon.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.only(top: 18.sp),
              margin: EdgeInsets.only(top: 18.sp),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 82.sp),
                    Text(
                      "Hurry Offers!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 41.sp,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 35.sp),
                    Text(
                      "#1243CD2",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24.sp),
                    Text(
                      "Use the cupon get 25% discount",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 18.sp),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 62.sp,
                        width: 279.sp,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.sp,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "GOT IT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFffe194),
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All categories",
                style: TextStyle(fontSize: 20.sp),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFFa0a5ba),
                    size: 27,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 103.sp,
          width: 375.sp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _isGettingCategories ? 2 : categoriesList.length,
            itemBuilder: (context, index) {
              return _isGettingCategories
                  // При загругзке
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 24.sp : 7.sp,
                            right: index == categoriesList.length - 1
                                ? 24.sp
                                : 7.sp,
                            top: 20.sp,
                            bottom: 20.sp),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(39.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.sp),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 44.sp,
                                  width: 100.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  // Сам виджет
                  : Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 24.sp : 7.sp,
                          right:
                              index == categoriesList.length - 1 ? 24.sp : 7.sp,
                          top: 20.sp,
                          bottom: 20.sp),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedCategoryIndex == index
                                ? const Color(0xFFffd27c)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(39.sp),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withAlpha(40),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.sp),
                            child: Row(
                              children: [
                                Container(
                                  height: 44.sp,
                                  width: 44.sp,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF98a8b8),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            categoriesList[index].imgAsset),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 12.sp),
                                Text(
                                  categoriesList[index].name,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 14.sp),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        )
      ],
    );
  }

  Widget hello() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Row(
        children: [
          Text(
            "Hey Halal, ",
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            "Good Afternoon!",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        height: 62.sp,
        width: 327.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: const Color(0xFFf6f6f6),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/search.svg",
                    // ignore: deprecated_member_use
                    color: const Color(0xFFa0a5ba),
                  ),
                  hintText: "Search dishes, restaurants",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsMy.gray1,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }
}
