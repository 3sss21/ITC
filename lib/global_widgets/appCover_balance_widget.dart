import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCoverBalanceWidget extends StatelessWidget {
  final String nameCover;
  final String? balance;
  const AppCoverBalanceWidget({
    Key? key,
    required this.nameCover,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 139.h,
      decoration: BoxDecoration(
        color: ThemeHelper.green80,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nameCover,
              style: TextStyle(
                color: ThemeHelper.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 44.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${balance ?? 00}0',
                    style: TextStyle(
                      color: ThemeHelper.yellow,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 22.w,
                    height: 19.h,
                    child: Image.asset(
                      "assets/images/coin.png",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
