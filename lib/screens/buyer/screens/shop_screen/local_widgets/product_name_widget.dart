import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductNameWidget extends StatelessWidget {
  final String productName;
  final Function() function;
  final TextStyle textStyle;
  final Color borderColor;
  const ProductNameWidget({
    Key? key,
    required this.productName,
    required this.function,
    required this.textStyle,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 140.r,
        height: 80.r,
        decoration: BoxDecoration(
          color: ThemeHelper.white,
          border: Border.all(
            color: borderColor,
            width: 0.4.w,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadowHelper.boxShadow25,
          ],
        ),
        child: Center(
          child: Text(
            productName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
