import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/screens/location_access_screen.dart';

import '../widgets/text_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    const TextBox(
                      titleText: 'NAME',
                      hintText: 'John doe',
                    ),
                    SizedBox(height: 24.sp),
                    const TextBox(
                      titleText: 'EMAIL',
                      hintText: 'example@gmail.com',
                    ),
                    SizedBox(height: 24.sp),
                    const TextBox(
                      titleText: 'PASSWORD',
                      hintText: '* * * * * * * * * *',
                      password: true,
                    ),
                    SizedBox(height: 24.sp),
                    const TextBox(
                      titleText: 'RE-TYPE PASSWORD',
                      hintText: '* * * * * * * * * *',
                      password: true,
                    ),
                    SizedBox(height: 29.sp),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LocationAccessScreen()));
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
                            "SIGN UP",
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

  Padding title() {
    return Padding(
      padding: EdgeInsets.only(top: 118.sp),
      child: Center(
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.sp),
            Text(
              "Please sign up to get started",
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
