import 'dart:developer';

import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  final TextEditingController controller;
  PinputWidget({Key? key, required this.controller}) : super(key: key);

  Box pincodeBox = Hive.box('pincodeBox');

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 20,
        color: ThemeHelper.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: ThemeHelper.green10,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ThemeHelper.cyan),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: ThemeHelper.green80,
      ),
    );
    return Pinput(
      length: 6,
      controller: controller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (value) {
        if (value?.length != 6) {
          return 'Пин-код не должен быть меньше шести символов';
        } else if (value != pincodeBox.get('pincode')) {
          log('Pincode pinput ======= ${pincodeBox.get('pincode')}');
          return 'Введите правильный пин-код';
        } else {
          return '';
        }
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
