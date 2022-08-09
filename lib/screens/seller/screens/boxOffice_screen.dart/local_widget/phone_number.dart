import 'package:cashback_app/commons/text_style_helper.dart';
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
      padding: EdgeInsets.only(left: 20.h, top: 16.h, bottom: 8.h),
      child: Text(
        phoneNumber,
        style:TextStyle(color: Color.fromRGBO(83, 42, 42, 0.8), fontSize: 16.sp)
      ),
    );
  }
}
