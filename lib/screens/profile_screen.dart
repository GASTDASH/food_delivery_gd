import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/account.dart';
import 'package:food_delivery_gd/screens/loading_screen.dart';
import 'package:food_delivery_gd/screens/login_screen.dart';
import 'package:food_delivery_gd/screens/personal_info_screen.dart';
import 'package:food_delivery_gd/supabase.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;

  void logOut() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await supabase.auth.signOut();

      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Ошибка"),
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
        ? const LoadingScreen(text: "Logging out...")
        : Scaffold(
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
                              account.fullname,
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.sp),
                            Text(
                              "I love fast food",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFFa0a5ba)),
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
                          profileButton(
                            iconAsset: "assets/svg/icons/user.svg",
                            iconColor: const Color(0xFFFB6F3D),
                            text: "Personal Info",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalInfoScreen()));
                            },
                          ),
                          SizedBox(height: 16.sp),
                          profileButton(
                            iconAsset: "assets/svg/icons/map.svg",
                            iconColor: const Color(0xFF413DFB),
                            text: "Address",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Container(
                      width: 327.sp,
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.sp),
                        color: const Color(0xFFf6f8fa),
                      ),
                      child: Column(
                        children: [
                          profileButton(
                            iconAsset: "assets/svg/icons/shopping-bag.svg",
                            iconColor: const Color(0xFF369BFF),
                            text: "Cart",
                            onTap: () {},
                          ),
                          SizedBox(height: 16.sp),
                          profileButton(
                            iconAsset: "assets/svg/icons/heart.svg",
                            iconColor: const Color(0xFFB33DFB),
                            text: "Favourite",
                            onTap: () {},
                          ),
                          SizedBox(height: 16.sp),
                          profileButton(
                            iconAsset: "assets/svg/icons/bell.svg",
                            iconColor: const Color(0xFFFFAA2A),
                            text: "Notification",
                            onTap: () {},
                          ),
                          SizedBox(height: 16.sp),
                          profileButton(
                            iconAsset: "assets/svg/icons/credit-card.svg",
                            iconColor: const Color(0xFF369BFF),
                            text: "Payment Method",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Container(
                      width: 327.sp,
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.sp),
                        color: const Color(0xFFf6f8fa),
                      ),
                      child: Column(
                        children: [
                          profileButton(
                            iconAsset: "assets/svg/icons/question.svg",
                            iconColor: const Color(0xFFFB6D3A),
                            text: "FAQ",
                            onTap: () {},
                          ),
                          SizedBox(height: 16.sp),
                          profileButton(
                            iconAsset: "assets/svg/icons/review.svg",
                            iconColor: const Color(0xFF2AE1E1),
                            text: "User Reviews",
                            onTap: () {},
                          ),
                          SizedBox(height: 16.sp),
                          profileButton(
                            iconAsset: "assets/svg/icons/settings.svg",
                            iconColor: const Color(0xFF413DFB),
                            text: "Settings",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Container(
                      width: 327.sp,
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.sp),
                        color: const Color(0xFFf6f8fa),
                      ),
                      child: Column(
                        children: [
                          profileButton(
                            iconAsset: "assets/svg/icons/logout.svg",
                            iconColor: const Color(0xFFFB4A59),
                            text: "Log Out",
                            onTap: () {
                              logOut();
                            },
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

  Widget profileButton({
    required String iconAsset,
    required Color iconColor,
    required String text,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.sp,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  iconAsset,
                  // ignore: deprecated_member_use
                  color: iconColor,
                  width: 18.sp,
                ),
              ),
              SizedBox(width: 14.sp),
              Text(text, style: TextStyle(fontSize: 16.sp))
            ],
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF747783),
          ),
        ],
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
    //     "Profile",
    //     style: TextStyle(fontSize: 17.sp),
    //   ),
    //   actions: [
    //     IconButton.filled(
    //       color: Colors.white,
    //       style: IconButton.styleFrom(backgroundColor: const Color(0xFFecf0f4)),
    //       onPressed: () {},
    //       icon: Icon(
    //         Icons.more_horiz,
    //         color: Colors.black,
    //         size: 30.sp,
    //       ),
    //     ),
    //   ],
    // );
    return CustomAppBar(
      title: "Profile",
      backgroundColor: Colors.white,
      buttonBackgroundColor: const Color(0xFFecf0f4),
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
