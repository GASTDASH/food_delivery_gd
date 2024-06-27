import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/widgets/text_box.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24.sp, vertical: 10.sp),
                    child: Container(
                      height: 117.sp,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            )
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
                        "\$96",
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
              Container(
                height: 62.sp,
                width: 327.sp,
                decoration: BoxDecoration(
                    color: ColorsMy.primary,
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
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.sp,
      backgroundColor: const Color(0xFF121223),
      surfaceTintColor: const Color(0xFF121223),
      leading: IconButton.filled(
        color: Colors.white,
        style: IconButton.styleFrom(backgroundColor: const Color(0xFF292939)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
      title: Text(
        "Cart",
        style: TextStyle(fontSize: 17.sp, color: Colors.white),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Text(
            "DONE",
            style: TextStyle(
              color: ColorsMy.success,
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
              decorationColor: ColorsMy.success,
            ),
          ),
        )
      ],
    );
  }
}
