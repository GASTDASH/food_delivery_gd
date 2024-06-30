import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/screens/payment_successful_screen.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: "Add Card",
        buttonBackgroundColor: const Color(0xFFecf0f4),
        icon: Icons.close_outlined,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 24.sp),
                TextBox(
                  hintText: 'Ivan Ivanov',
                  titleText: "CARD HOLDER NAME",
                  titleTextColor: const Color(0xFFA0A5BA),
                  titleTextSize: 14.sp,
                  textSize: 16.sp,
                ),
                SizedBox(height: 24.sp),
                TextBox(
                  hintText: '_ _ _ _  _ _ _ _  _ _ _ _  _ _ _ _',
                  titleText: "CARD NUMBER",
                  titleTextColor: const Color(0xFFA0A5BA),
                  titleTextSize: 14.sp,
                  textSize: 16.sp,
                ),
                SizedBox(height: 24.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBox(
                      hintText: 'mm/yyyy',
                      titleText: "EXPIRE DATE",
                      titleTextColor: const Color(0xFFA0A5BA),
                      titleTextSize: 14.sp,
                      textSize: 16.sp,
                      width: 150.sp,
                    ),
                    TextBox(
                      hintText: '***',
                      titleText: "CVC",
                      titleTextColor: const Color(0xFFA0A5BA),
                      titleTextSize: 14.sp,
                      textSize: 16.sp,
                      width: 150.sp,
                    ),
                  ],
                ),
                SizedBox(height: 24.sp),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PaymentSuccessfulScreen()));
                },
                child: Container(
                  height: 62.sp,
                  width: 327.sp,
                  margin: EdgeInsets.only(bottom: 30.sp),
                  decoration: BoxDecoration(
                    color: ColorsMy.primary,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Center(
                    child: Text(
                      "ADD & MAKE PAYMENT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
