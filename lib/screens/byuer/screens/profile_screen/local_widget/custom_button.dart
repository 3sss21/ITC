import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton1 extends StatelessWidget {
  final String buttonText;
  const CustomButton1({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 98.w,
        height: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeHelper.white,
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ThemeHelper.green100,
          ),
        ),
      ),
    );
  }
}