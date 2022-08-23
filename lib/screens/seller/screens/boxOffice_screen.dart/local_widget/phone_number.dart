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
      padding: EdgeInsets.only(
        left: 20.h,
        top: 16.h,
        bottom: 8.h,
      ),
||||||| fa3e7f1
      padding: EdgeInsets.only(left: 20.h, top: 16.h, bottom: 8.h),
=======
      padding: EdgeInsets.only(right: 170.w, bottom: 8.h, top: 8.h),
>>>>>>> a3ffc5629ab3b584d61a2d907e7ea154f1497465
      child: Text(
        phoneNumber,
<<<<<<< HEAD
        style: TextStyle(
          color: ThemeHelper.brown80,
          fontSize: 16.sp,
        ),
||||||| fa3e7f1
        style:TextStyle(color: Color.fromRGBO(83, 42, 42, 0.8), fontSize: 16.sp)
=======
        style: TextStyle(color: ThemeHelper.brown80, fontSize: 16.sp),
>>>>>>> a3ffc5629ab3b584d61a2d907e7ea154f1497465
      ),
    );
  }
}
