import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_gd/models/colors.dart';
import 'package:food_delivery_gd/models/payment_method.dart';
import 'package:food_delivery_gd/widgets/widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.totalValue});

  final double totalValue;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPaymentMethodIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          SizedBox(height: 24.sp),
          SizedBox(
            height: 100.sp,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: paymantMethodsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PaymentMethodWidget(
                  index: index,
                  selected: index == selectedPaymentMethodIndex,
                  onTap: (value) {
                    setState(() {
                      selectedPaymentMethodIndex = value;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 25.sp),
          Container(
            height: 257.sp,
            width: 327.sp,
            decoration: BoxDecoration(
              color: const Color(0xFFf0f5fa),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/icons/no-card.svg"),
                  SizedBox(height: 24.sp),
                  Text(
                    "No Mastercard added",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.sp),
                  SizedBox(
                    width: 260.sp,
                    child: Text(
                      "You can add a mastercard and save it for later",
                      style: TextStyle(fontSize: 15.sp),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15.sp),
          Container(
            height: 62.sp,
            width: 327.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFf0f5fa),
                width: 2.sp,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/icons/plus.svg",
                    // ignore: deprecated_member_use
                    color: ColorsMy.primary,
                    height: 25.sp,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    "ADD NEW",
                    style: TextStyle(
                      color: ColorsMy.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "TOTAL:",
                          style: TextStyle(
                              color: const Color(0xFFa0a5ba), fontSize: 14.sp),
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          "\$${widget.totalValue}",
                          style: TextStyle(
                              color: const Color(0xFF181C2E), fontSize: 30.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 26.sp),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 62.sp,
                        width: 327.sp,
                        decoration: BoxDecoration(
                            color: ColorsMy.primary,
                            borderRadius: BorderRadius.circular(12.sp)),
                        child: Center(
                          child: Text(
                            "PAY & CONFIRM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.sp),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 200.sp,
      //   width: 375.sp,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(24.sp),
      //     ),
      //   ),
      // ),
    );
  }

  PreferredSizeWidget appBar() {
    return CustomAppBar(
      backgroundColor: Colors.white,
      title: "Payment",
      buttonBackgroundColor: const Color(0xFFecf0f4),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final bool selected;

  // int onTap() {
  //   return index;
  // }

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        width: 85.sp,
        height: 93.sp,
        margin: EdgeInsets.only(
            left: index == 0 ? 24.sp : 8.sp,
            right: index == paymantMethodsList.length - 1 ? 24.sp : 8.sp),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 72.sp,
                  width: 85.sp,
                  margin: EdgeInsets.all(2.sp).copyWith(bottom: 0),
                  decoration: BoxDecoration(
                    color:
                        selected ? Colors.transparent : const Color(0xFFf0f5fa),
                    borderRadius: BorderRadius.circular(10.sp),
                    border: selected
                        ? Border.all(color: ColorsMy.primary, width: 2.sp)
                        : null,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      paymantMethodsList[index].iconAsset,
                    ),
                  ),
                ),
                selected
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 24.sp,
                          width: 24.sp,
                          decoration: BoxDecoration(
                            color: ColorsMy.primary,
                            borderRadius: BorderRadius.circular(24.sp),
                            border:
                                Border.all(color: Colors.white, width: 2.sp),
                          ),
                          child: const Icon(
                            Icons.check_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            SizedBox(height: 4.sp),
            Text(
              paymantMethodsList[index].name,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
