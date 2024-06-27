import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/account.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/screens/edit_profile_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              SizedBox(height: 20.sp),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFffc6ae),
                    radius: 50.sp,
                  ),
                  SizedBox(width: 32.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myAccount.fullname,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.sp),
                      Text(
                        "I love fast food",
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xFFa0a5ba)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.sp),
              Container(
                width: 327.sp,
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  color: const Color(0xFFf6f8fa),
                ),
                child: Column(
                  children: [
                    infoButton(
                      iconAsset: "assets/svg/icons/user.svg",
                      iconColor: const Color(0xFFFB6F3D),
                      title: "FULL NAME",
                      subtitle: myAccount.fullname,
                    ),
                    SizedBox(height: 16.sp),
                    infoButton(
                      iconAsset: "assets/svg/icons/mail.svg",
                      iconColor: const Color(0xFF413DFB),
                      title: "EMAIL",
                      subtitle: myAccount.email,
                    ),
                    SizedBox(height: 16.sp),
                    infoButton(
                      iconAsset: "assets/svg/icons/call.svg",
                      iconColor: const Color(0xFF369BFF),
                      title: "PHONE NUMBER",
                      subtitle: myAccount.phone,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoButton({
    required String iconAsset,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.sp,
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            iconAsset,
            color: iconColor,
            width: 18.sp,
          ),
        ),
        SizedBox(width: 14.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 14.sp)),
            Text(subtitle,
                style:
                    TextStyle(fontSize: 14.sp, color: const Color(0xFF6B6E82))),
          ],
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.sp,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: IconButton.filled(
        color: Colors.white,
        style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30.sp,
        ),
      ),
      title: Text(
        "Profile",
        style: TextStyle(fontSize: 17.sp),
      ),
      actions: [
        // IconButton.filled(
        //   color: Colors.white,
        //   style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.more_horiz,
        //     color: Colors.black,
        //     size: 30.sp,
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfileScreen()));
          },
          child: Text(
            "EDIT",
            style: TextStyle(
              color: ColorsMy.primary,
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
              decorationColor: ColorsMy.primary,
            ),
          ),
        )
      ],
    );
  }
}
