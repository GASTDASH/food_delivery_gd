import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/account.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/screens/forgot_password_screen.dart';
import 'package:food_delivery_gd/screens/loading_screen.dart';
import 'package:food_delivery_gd/screens/location_access_screen.dart';
import 'package:food_delivery_gd/screens/signup_screen.dart';

import '../widgets/text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  bool _rememberMe = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await accountLogin(
        email: emailController.text,
        password: passwordController.text,
      );

      account = Account(email: "{email}", fullname: "{fullname}");
      account.update();

      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const LocationAccessScreen()),
            (route) => false);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            duration: Durations.extralong4,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingScreen(text: "Logging in...")
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFF121223),
            body: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/bg.svg",
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
                          TextBox(
                            titleText: 'EMAIL',
                            hintText: 'example@gmail.com',
                            controller: emailController,
                          ),
                          SizedBox(height: 24.sp),
                          TextBox(
                            titleText: 'PASSWORD',
                            hintText: '* * * * * * * * * *',
                            password: true,
                            controller: passwordController,
                          ),
                          SizedBox(height: 24.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20.sp,
                                    width: 20.sp,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                        side: BorderSide(width: 2.sp),
                                      ),
                                      // color: ColorsMy.gray2,
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = !_rememberMe;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordScreen()));
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    color: ColorsMy.primary,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 29.sp),
                          GestureDetector(
                            onTap: () async {
                              login();
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
                                  "LOG IN",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 38.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?  ",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: ColorsMy.primary,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 27.sp),
                          Center(
                            child: Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/svg/facebook.svg"),
                              SvgPicture.asset("assets/svg/twitter.svg"),
                              SvgPicture.asset("assets/svg/apple.svg"),
                            ],
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
              "Log In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.sp),
            Text(
              "Please sign in to your existing account",
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
