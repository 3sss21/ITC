import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtonWidget extends StatelessWidget {
  final String txtButton;
  final Function() function;
  final double width;
  const AuthButtonWidget({
    Key? key,
    required this.txtButton,
    required this.function,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 25.h,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Text(
          txtButton,
          style: TextStyleHelper.authButtonText,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ThemeHelper.white),
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
