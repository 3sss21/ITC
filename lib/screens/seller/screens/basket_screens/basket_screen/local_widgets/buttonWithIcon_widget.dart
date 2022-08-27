import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWithIconWidget extends StatelessWidget {
  final String buttonTxt;
  final Widget iconWidget;
  final Function() function;
  const ButtonWithIconWidget({
    Key? key,
    required this.function,
    required this.buttonTxt,
    required this.iconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 320.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: ThemeHelper.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [BoxShadowHelper.boxShadow50],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 60.w, right: 13.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140.w,
                child: Text(
                  buttonTxt,
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.f14w600green80,
                ),
              ),
              iconWidget
            ],
          ),
        ),
      ),
    );
  }
}