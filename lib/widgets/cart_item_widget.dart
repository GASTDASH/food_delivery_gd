import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_gd/models/cart.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onPriceChanged,
    required this.cartItemIndex,
  });

  final CartItem cartItem;
  final int cartItemIndex;
  final Function onPriceChanged;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int foodCount = 0;

  @override
  void initState() {
    super.initState();

    foodCount = widget.cartItem.count;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 117.sp,
            width: 136.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.sp),
              image: DecorationImage(
                image: AssetImage(
                    widget.cartItem.food.imgAsset ?? "assets/img/no_food.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.sp),
          SizedBox(
            height: 117.sp,
            width: 170.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 140.sp,
                      child: Text(
                        widget.cartItem.food.name,
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.sp, height: 1.sp),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cart.removeItem(widget.cartItem.food);
                        });
                        widget.onPriceChanged();
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFE04444),
                        radius: 27.sp / 2,
                        child: SvgPicture.asset(
                          "assets/svg/icons/cross.svg",
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "\$${widget.cartItem.food.price * foodCount}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cartItem.size ?? "",
                        style: TextStyle(
                          color: const Color(0xFF888891),
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(
                        height: 22.sp,
                        width: 89.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  foodCount > 1
                                      ? {
                                          cart.items[widget.cartItemIndex]
                                              .count--,
                                          foodCount--
                                        }
                                      : {};
                                });

                                widget.onPriceChanged();
                              },
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF41414f),
                                radius: 11.sp,
                                child: SvgPicture.asset(
                                  "assets/svg/icons/minus.svg",
                                  // ignore: deprecated_member_use
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
                                  foodCount < 10
                                      ? {
                                          cart.items[widget.cartItemIndex]
                                              .count++,
                                          foodCount++
                                        }
                                      : {};
                                });
                                widget.onPriceChanged();
                              },
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF41414f),
                                radius: 11.sp,
                                child: SvgPicture.asset(
                                  "assets/svg/icons/plus.svg",
                                  // ignore: deprecated_member_use
                                  color: Colors.white,
                                  width: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
