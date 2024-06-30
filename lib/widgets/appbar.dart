import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.buttonBackgroundColor,
    this.actions = const [],
    this.textColor = const Color(0xFF181C2E),
    this.iconColor = Colors.black,
  });

  final String title;
  final List<Widget> actions;
  final Color backgroundColor;
  final Color buttonBackgroundColor;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   toolbarHeight: 60.sp,
    //   backgroundColor: backgroundColor,
    //   surfaceTintColor: backgroundColor,
    //   leading: IconButton.filled(
    //     color: Colors.white,
    //     style: IconButton.styleFrom(backgroundColor: buttonBackgroundColor),
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
    //     title,
    //     style: TextStyle(fontSize: 17.sp),
    //   ),
    //   actions: actions,
    // );
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        margin: EdgeInsets.only(top: 24.sp),
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton.filled(
                  color: Colors.white,
                  style: IconButton.styleFrom(
                      backgroundColor: buttonBackgroundColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: iconColor,
                    size: 30.sp,
                  ),
                ),
                SizedBox(width: 16.sp),
                Text(
                  title,
                  style: TextStyle(fontSize: 17.sp, color: textColor),
                ),
              ],
            ),
            ...actions,
          ],
        ),
      ),
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(60.sp);
}
