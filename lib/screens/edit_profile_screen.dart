import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/account.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fullnameController.text = account.fullname;
    emailController.text = account.email;
    phoneController.text = account.phone ?? "";
    bioController.text = "I love fast food";
  }

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
              Center(
                child: CircleAvatar(
                  backgroundColor: const Color(0xFFffc6ae),
                  radius: 65.sp,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 41.sp / 2,
                      backgroundColor: ColorsMy.primary,
                      child: SvgPicture.asset(
                        "assets/svg/icons/pen.svg",
                        height: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
              TextBox(
                titleText: "FULL NAME",
                hintText: "",
                controller: fullnameController,
              ),
              SizedBox(height: 24.sp),
              TextBox(
                titleText: "EMAIL",
                hintText: "",
                controller: emailController,
              ),
              SizedBox(height: 24.sp),
              TextBox(
                titleText: "PHONE NUMBER",
                hintText: "",
                controller: phoneController,
              ),
              SizedBox(height: 24.sp),
              TextBox(
                titleText: "BIO",
                hintText: "",
                controller: bioController,
                height: 103.sp,
              ),
              SizedBox(height: 32.sp),
              Container(
                height: 62.sp,
                width: 327.sp,
                decoration: BoxDecoration(
                  color: ColorsMy.primary,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    // return AppBar(
    //   toolbarHeight: 60.sp,
    //   backgroundColor: Colors.white,
    //   surfaceTintColor: Colors.white,
    //   leading: IconButton.filled(
    //     color: Colors.white,
    //     style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //     icon: Icon(
    //       Icons.chevron_left,
    //       color: Colors.black,
    //       size: 30.sp,
    //     ),
    //   ),
    //   title: Text(
    //     "Edit Profile",
    //     style: TextStyle(fontSize: 17.sp),
    //   ),
    // );
    return CustomAppBar(
      title: "Edit Profile",
      backgroundColor: Colors.white,
      buttonBackgroundColor: const Color(0xFFecf0f4),
    );
  }
}
