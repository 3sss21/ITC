import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainerWidget extends StatelessWidget {
  final String productName;
  final Function() function;
  const ProductContainerWidget({
    Key? key,
    required this.productName,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function(),
      child: Container(
        width: 140.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: ThemeHelper.white,
          border: Border.all(
            color: ThemeHelper.green50,
            width: 0.4.w,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ThemeHelper.green25,
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            productName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ThemeHelper.green80,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
