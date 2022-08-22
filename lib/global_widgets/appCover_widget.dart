import 'package:cashback_app/commons/images_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCoverWidget extends StatelessWidget {
  final String nameCover;
  final bool isSeller;
  const AppCoverWidget(
      {Key? key, required this.nameCover, required this.isSeller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 139.h,
      decoration: BoxDecoration(
        color: isSeller ? ThemeHelper.brown80 : ThemeHelper.green80,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nameCover.toUpperCase(),
              style: TextStyle(
                color: ThemeHelper.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 137.w),
            SizedBox(
              width: 58.w,
              height: 58.h,
              child: Image(
                image: AssetImage(ImageHelper.felizLogo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
