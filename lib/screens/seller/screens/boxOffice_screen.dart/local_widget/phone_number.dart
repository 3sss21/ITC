import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumber extends StatelessWidget {
  final int phoneNumber;

  const PhoneNumber({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 170.w,
        bottom: 8.h,
        top: 16.h,
      ),
      child: Text(
        '+996' + '$phoneNumber',
        style: TextStyle(
          color: ThemeHelper.brown80,
          fontSize: 16.sp,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
