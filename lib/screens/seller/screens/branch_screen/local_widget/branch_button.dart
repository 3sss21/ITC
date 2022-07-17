import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchButton extends StatelessWidget {
  final String titleOfBranch;
  final double width;
  final double height;
  final double fontSize;

  final Function() function;
  const BranchButton({
    Key? key,
    required this.titleOfBranch,
    required this.function,
    required this.width,
    required this.height,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width.w, height.h),
        maximumSize: Size(width.w, height.h),
        primary: ThemeHelper.green80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: () => function(),
      child: Text(
        titleOfBranch,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
