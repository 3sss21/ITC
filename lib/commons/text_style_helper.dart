import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyleHelper {
  static TextStyle medium18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: "Lato",
    fontWeight: FontWeight.w400,
  );

  static TextStyle medium20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: "Lato",
    fontWeight: FontWeight.w400,
  );

  static TextStyle medium22 = TextStyle(
    fontSize: 22.sp,
    fontFamily: "Lato",
    fontWeight: FontWeight.w400,
  );

  static TextStyle bold22 = TextStyle(
    fontSize: 22.sp,
    fontFamily: "Lato",
    fontWeight: FontWeight.w700,
  );

  static TextStyle authButtonText = TextStyle(
    color: ThemeHelper.green100,
    fontFamily: "Lato",
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle functionBox = TextStyle(
    fontFamily: "Lato",
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ThemeHelper.white,
  );

  static TextStyle authBox = TextStyle(
    fontFamily: "Lato",
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: ThemeHelper.white,
  );

  static TextStyle forgotPass = TextStyle(
    fontFamily: "Lato",
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: ThemeHelper.white50,
  );

  static TextStyle textDate = TextStyle(
    fontFamily: "Lato",
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.green100,
  );

  static TextStyle f16fw700 = TextStyle(
    fontFamily: "Lato",
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: ThemeHelper.yellow,
  );

  static TextStyle productName = TextStyle(
    fontFamily: 'Lato',
    color: ThemeHelper.green80,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle f12w400 = TextStyle(
    fontFamily: 'Lato',
    color: ThemeHelper.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle f14w600 = TextStyle(
    fontFamily: 'Lato',
    color: ThemeHelper.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle f12fw600 = TextStyle(
    fontFamily: 'Lato',
    color: ThemeHelper.green80,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle f14fw500 = TextStyle(
    fontFamily: 'Lato',
   color: ThemeHelper.green60,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle f14w600green80 = TextStyle(
    fontFamily: 'Lato',
    color: ThemeHelper.green80,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
}
