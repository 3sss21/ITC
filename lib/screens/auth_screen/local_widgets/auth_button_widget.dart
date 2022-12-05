import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtonWidget extends StatelessWidget {
  final String txtButton;
  final Function() function;
  final double width;
  final double height;
  final Color themeButton;
  final Color textColor;

  const AuthButtonWidget({
    Key? key,
    required this.txtButton,
    required this.function,
    required this.width,
    required this.themeButton,
    required this.textColor,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Text(
          txtButton,
          style: TextStyleHelper.authButtonText.copyWith(color: textColor),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(themeButton),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }
}
