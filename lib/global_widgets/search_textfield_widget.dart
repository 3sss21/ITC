import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final Color hintTextColor;
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  const SearchTextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.contentPadding,
    required this.hintTextColor,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: SizedBox(
        width: 334.w,
        height: 38.h,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintText: hintText,
            hintStyle: TextStyle(
              height: 0.5.h,
              color: hintTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: fillColor,
          ),
        ),
      ),
    );
  }
}
