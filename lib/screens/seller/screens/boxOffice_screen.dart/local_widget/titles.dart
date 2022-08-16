import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        SizedBox(width: 20.w),
        Text('Стоимость', style: TextStyleHelper.f14w600),
        SizedBox(width: 20.w),
        Text('Кэшбек', style: TextStyleHelper.f14w600),
      ],
    );
  }
}
