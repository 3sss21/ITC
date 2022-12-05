import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialogWidget extends StatelessWidget {
  final Function() onPressed;
  final String contentText;
  final String buttonText;
  final EdgeInsets contentPadding;
  final EdgeInsets buttonPadding;

  const ShowDialogWidget({
    Key? key,
    required this.onPressed,
    required this.contentText,
    required this.buttonText,
    required this.contentPadding,
    required this.buttonPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: contentPadding,
      content: Text(
        contentText,
        textAlign: TextAlign.center,
      ),
      contentTextStyle: TextStyleHelper.f16Green100,
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Padding(
          padding: buttonPadding,
          child: AuthButtonWidget(
            txtButton: buttonText,
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
