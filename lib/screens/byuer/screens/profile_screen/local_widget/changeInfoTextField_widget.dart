// ignore_for_file: must_be_immutable

import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeInfoTextFieldWidget extends StatelessWidget {
  final String valueTextField;
  final TextEditingController? controller;
  // final TextInputType? keyboardType;
  final bool isObscureText;

  const ChangeInfoTextFieldWidget({
    Key? key,
    required this.valueTextField,
    this.controller,
    // this.keyboardType,
    this.isObscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$valueTextField:',
          style: TextStyleHelper.productName.copyWith(
            color: ThemeHelper.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: SizedBox(
            width: 120.w,
            height: 16.h,
            child: TextFormField(
              obscureText: isObscureText,
              // keyboardType: keyboardType,q
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeHelper.white,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
