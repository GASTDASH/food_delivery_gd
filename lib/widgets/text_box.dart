import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_gd/models/colors.dart';

class TextBox extends StatefulWidget {
  const TextBox({
    super.key,
    required this.titleText,
    required this.hintText,
    this.password = false,
    this.text = "",
    this.controller,
    this.height,
  });

  final String titleText;
  final String hintText;
  final bool password;
  final String text;
  final TextEditingController? controller;
  final double? height;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: TextStyle(fontSize: 13.sp),
        ),
        SizedBox(height: 8.sp),
        Container(
          height: widget.height ?? 62.sp,
          width: 327.sp,
          decoration: BoxDecoration(
            color: const Color(0xFFf0f5fa),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 19.sp, right: 8.sp),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: widget.hintText,
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: ColorsMy.gray1,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  widget.password
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility),
                          color: ColorsMy.gray1,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
