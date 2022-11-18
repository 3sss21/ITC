import 'package:cashback_app/commons/theme_helper.dart';
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
    return SizedBox(
      width: 336.r,
      height: 38.r,
      child: TextField(
        readOnly: true,
        controller: controller,
        keyboardType: TextInputType.text,
        cursorColor: ThemeHelper.brown20,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
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
        style: TextStyle(
          color: ThemeHelper.brown80,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
