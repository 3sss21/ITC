import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTryAgainWidget extends StatelessWidget {
  final Function() onPressed;
  final Color btnTheme;
  const ButtonTryAgainWidget({
    Key? key,
    required this.onPressed,
    required this.btnTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        'Повторить',
        style: TextStyleHelper.functionBox,
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 7.h,
        ),
        backgroundColor: btnTheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        shadowColor: ThemeHelper.brown80,
      ),
    );
  }
}
