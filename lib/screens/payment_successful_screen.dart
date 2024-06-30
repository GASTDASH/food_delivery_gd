import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/colors.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Картинка
                Container(
                  height: 207.sp,
                  width: 228.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xFF98a8b8),
                    borderRadius: BorderRadius.circular(32.sp),
                    image: const DecorationImage(
                      image: AssetImage("assets/img/all_food.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 32.sp),
                // Поздравляем!
                Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.sp),

                // маленький текст
                Text(
                  "You successfully maked a payment,\nenjoy our service!",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF525C67),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
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
                    "TRACK ORDER",
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
    );
  }
}
