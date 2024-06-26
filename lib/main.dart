import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/colors.dart';
import 'package:food_delivery_gd/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sen',
          primaryColor: ColorsMy.primary,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsMy.primary,
            background: Colors.white,
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
