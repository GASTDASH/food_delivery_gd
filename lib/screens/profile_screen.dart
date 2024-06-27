import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
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
        IconButton.filled(
          color: Colors.white,
          style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
