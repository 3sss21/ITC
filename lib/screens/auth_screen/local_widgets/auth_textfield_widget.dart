import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final String hintext;
  final TextEditingController? controller;
  const AuthTextFieldWidget({
    Key? key,
    required this.hintext,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.w,
      height: 20.h,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeHelper.white50,
            ),
          ),
          hintText: hintext,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ThemeHelper.white70,
          ),
        ),
      ),
    );
  }
}
