import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarItemHelper {
  BottomNavigationBarItem barItem(String iconImages) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconImages,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white50,
      ),
      activeIcon: Image.asset(
        iconImages,
        width: 40.w,
        height: 40.h,
        color: ThemeHelper.white,
      ),
      label: '',
    );
  }
}
