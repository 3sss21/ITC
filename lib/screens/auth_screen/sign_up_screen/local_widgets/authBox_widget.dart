import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBoxWidget extends StatelessWidget {
  final String functionBox;
  final List<Widget>? listWidgets;
  const AuthBoxWidget({
    Key? key,
    required this.functionBox,
    required this.listWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ThemeHelper.green80,
      ),
      child: Column(
        children: [
          SizedBox(height: 50.h),
          SizedBox(
            width: 270.w,
            child: Text(
              "Добро пожаловать в cashback-сервис \n FELIZ",
              textAlign: TextAlign.center,
              style: TextStyleHelper.f20w700,
            ),
          ),
          SizedBox(height: 29.h),
          SizedBox(
            width: 270.w,
            child: Text(
              functionBox,
              textAlign: TextAlign.center,
              style: TextStyleHelper.functionBox,
            ),
          ),
          Column(
            children: listWidgets!,
          ),
        ],
      ),
    );
  }
}
