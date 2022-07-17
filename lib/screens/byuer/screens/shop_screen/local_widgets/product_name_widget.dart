import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductNameWidget extends StatelessWidget {
  final String productName;
  final Function() function;
  const ProductNameWidget({
    Key? key,
    required this.productName,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 140.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: ThemeHelper.white,
          border: Border.all(
            color: ThemeHelper.green50,
            width: 0.4.w,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadowHelper.boxShadow25,
          ],
        ),
        child: Center(
          child: Text(
            productName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyleHelper.productName,
          ),
        ),
      ),
    );
  }
}
