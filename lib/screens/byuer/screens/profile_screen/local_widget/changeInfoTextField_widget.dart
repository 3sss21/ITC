// ignore_for_file: must_be_immutable

import 'package:cashback_app/commons/theme_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeInfoTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const ChangeInfoTextFieldWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: UnderlineInputBorder()
      ),
    );
  }
}
