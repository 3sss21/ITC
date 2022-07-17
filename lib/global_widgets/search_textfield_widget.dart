import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  const SearchTextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.contentPadding,
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
              color: ThemeHelper.green80,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: const Color.fromRGBO(23, 69, 59, 0.2),
          ),
        ),
      ),
    );
  }
}
