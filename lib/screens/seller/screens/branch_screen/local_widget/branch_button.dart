import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchButton extends StatelessWidget {
  final String titleOfBranch;
  final Function() function;
  const BranchButton({
    Key? key,
    required this.titleOfBranch,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300.w, 100.h),
        maximumSize: Size(300.w, 100.h),
        primary: ThemeHelper.green80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () => function,
      child: Text(
        titleOfBranch,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}