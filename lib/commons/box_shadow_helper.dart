import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';

class BoxShadowHelper{
  static BoxShadow boxShadow50 = BoxShadow(
    color: ThemeHelper.green50,
    offset: const Offset(0, 4),
    blurRadius: 10,
    spreadRadius: 0,
  );
  static BoxShadow boxShadow25 = BoxShadow(
    color: ThemeHelper.green25,
    offset: const Offset(0, 4),
    blurRadius: 10,
    spreadRadius: 0,
  );
}