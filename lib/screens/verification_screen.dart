import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF121223),
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/bg.svg",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 50.sp),
            child: SizedBox(
              height: 45.sp,
              width: 45.sp,
              child: IconButton.filled(
                color: Colors.white,
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: const Color(0xFF5e616f),
                  size: 30.sp,
                ),
              ),
            ),
          ),
          title(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFffffff),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.sp),
                ),
              ),
              height: 579.sp,
              width: 375.sp,
              child: Padding(
                padding: EdgeInsets.all(24.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CODE",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(height: 8.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textBoxDigit(),
                        textBoxDigit(),
                        textBoxDigit(),
                        textBoxDigit(),
                      ],
                    ),
                    SizedBox(height: 29.sp),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 62.sp,
                        width: 327.sp,
                        decoration: BoxDecoration(
                          color: ColorsMy.primary,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Center(
                          child: Text(
                            "VERIFY",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container textBoxDigit() {
    return Container(
      height: 62.sp,
      width: 62.sp,
      decoration: BoxDecoration(
        color: const Color(0xFFf0f5fa),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 19.sp, right: 8.sp),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsMy.gray1,
                ),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: EdgeInsets.only(top: 118.sp),
      child: Center(
        child: Column(
          children: [
            Text(
              "Verification",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.sp),
            Text(
              "We have sent a code to your email",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
