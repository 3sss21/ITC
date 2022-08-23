import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';

class ValueTextFieldWidget extends StatelessWidget {
  final String valueTextField;

  const ValueTextFieldWidget({Key? key, required this.valueTextField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$valueTextField:',
      style: TextStyleHelper.productNameGreen80.copyWith(
        color: ThemeHelper.white,
      ),
    );
  }
}
