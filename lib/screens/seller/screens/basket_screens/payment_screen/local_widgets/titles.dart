import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Titles extends StatelessWidget {
  final String title;

  const Titles({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 27.44.h, bottom: 14.63.h),
      child: Text(title, style: TextStyleHelper.f14w400white),
    );
  }
}
