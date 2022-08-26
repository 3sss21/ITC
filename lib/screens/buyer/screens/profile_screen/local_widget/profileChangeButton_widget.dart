import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileChangeButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function() onTapFunction;
  const ProfileChangeButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapFunction(),
      child: Container(
        width: 179.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ThemeHelper.white,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyleHelper.authButtonText,
          ),
        ),
      ),
    );
  }
}
