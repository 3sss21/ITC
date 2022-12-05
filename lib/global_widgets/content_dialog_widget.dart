import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentDialogWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final String? username;
  final String? cashback;
  final EdgeInsets contentPadding;
  final EdgeInsets buttonPadding;

  const ContentDialogWidget({
    Key? key,
    required this.onPressed,
    required this.contentPadding,
    required this.buttonPadding,
    required this.username,
    required this.cashback,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyleHelper.f16Green100,
      ),
      contentPadding: contentPadding,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Покупатель: ${username ?? 'unknown'}',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Text(
            'Баллы: ${cashback ?? 'unknown'}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      contentTextStyle: TextStyleHelper.f16Green100,
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Padding(
          padding: buttonPadding,
          child: AuthButtonWidget(
            txtButton: 'Перейти в корзину',
            function: () => onPressed(),
            width: 200.w,
            height: 30.h,
            themeButton: ThemeHelper.green80,
            textColor: ThemeHelper.white,
          ),
        ),
      ],
    );
  }
}
