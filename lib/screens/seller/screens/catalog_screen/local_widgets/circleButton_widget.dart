import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButtonWidget extends StatelessWidget {
  final Widget iconWidget;
  final Function() function;
  const CircleButtonWidget({
    Key? key,
    required this.iconWidget,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadowHelper.boxShadow25],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: iconWidget
        ),
      ),
    );
  }
}