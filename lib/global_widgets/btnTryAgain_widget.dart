import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTryAgainWidget extends StatelessWidget {
  final Function() onTabFunction;
  final Color btnTheme;
  const ButtonTryAgainWidget({
    Key? key,
    required this.onTabFunction,
    required this.btnTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => onTabFunction(),
        child: Text(
          'Try Again',
          style: TextStyleHelper.functionBox,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(btnTheme),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
          shadowColor: MaterialStateProperty.all(ThemeHelper.brown80),
        ),
      ),
    );
  }
}
