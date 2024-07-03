import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/screens/loading_screen.dart';
import 'package:food_delivery_gd/screens/location_access_screen.dart';
import 'package:food_delivery_gd/supabase.dart';

import '../widgets/text_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void singUp() async {
    if (validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        // Регистрация
        await supabase.auth.signUp(
          email: emailController.text,
          password: passwordController.text,
        );

        // Авторизация
        await supabase.auth.signInWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        String id = supabase.auth.currentSession!.user.id;

        await supabase.from("accounts").insert(
          {
            "id": id,
            "fullname": nameController.text,
          },
        );

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
              duration: const Duration(seconds: 5),
            ),
          );
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  bool eqPasswords() {
    return passwordController.text == rePasswordController.text;
  }

  bool noNullFields() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        rePasswordController.text.isNotEmpty;
  }

  bool validate() {
    bool validate = noNullFields() && eqPasswords();

    if (!validate) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Неправильно введены данные"),
        ),
      );
    }

    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingScreen(text: "Signing Up...")
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFF121223),
            body: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/bg.svg",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.sp, vertical: 50.sp),
                  child: SizedBox(
                    height: 45.sp,
                    width: 45.sp,
                    child: IconButton.filled(
                      color: Colors.white,
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
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
                          TextBox(
                            titleText: 'NAME',
                            hintText: 'John doe',
                            controller: nameController,
                          ),
                          SizedBox(height: 24.sp),
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
                          TextBox(
                            titleText: 'RE-TYPE PASSWORD',
                            hintText: '* * * * * * * * * *',
                            password: true,
                            controller: rePasswordController,
                          ),
                          SizedBox(height: 29.sp),
                          GestureDetector(
                            onTap: () async {
                              singUp();
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
