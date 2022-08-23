import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumber extends StatelessWidget {
  final String phoneNumber;

  const PhoneNumber({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
<<<<<<< HEAD
      padding: EdgeInsets.only(right: 170.w, bottom: 8.h, top: 8.h),
      child: Text(
        phoneNumber,
        style: TextStyle(color: ThemeHelper.brown80, fontSize: 16.sp),
=======
      padding: EdgeInsets.only(
        left: 20.h,
        top: 16.h,
        bottom: 8.h,
      ),
      child: Text(
        phoneNumber,
        style: TextStyle(
          color: ThemeHelper.brown80,
          fontSize: 16.sp,
        ),
>>>>>>> d9d046e37d0a194d33bf2659f53c361cb03aacaf
      ),
    );
  }
}
