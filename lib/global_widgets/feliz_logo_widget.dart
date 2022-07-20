import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FelizLogoWidget extends StatelessWidget {
  const FelizLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 225.w,
      top: -150.h,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Image.asset(
          "assets/images/feliz_logo.png",
          color: ThemeHelper.green80,
        ),
      ),
    );
  }
}