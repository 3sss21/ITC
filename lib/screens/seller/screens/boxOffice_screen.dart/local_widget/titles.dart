import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  const Titles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Наименование', style: TextStyleHelper.f14w600),
        Text('Стоимость', style: TextStyleHelper.f14w600),
        Text('Кэшбек', style: TextStyleHelper.f14w600),
      ],
    );
  }
}
