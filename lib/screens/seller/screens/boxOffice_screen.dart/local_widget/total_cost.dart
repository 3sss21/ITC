import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalCost extends StatelessWidget {
  final String product;
  final String cost;
  final String cashback;

  const TotalCost({
    Key? key,
    required this.product,
    required this.cost,
    required this.cashback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 107.w,
            child: Text(product, style: TextStyleHelper.f12w400),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 71.w,
            child: Text(cost, style: TextStyleHelper.f12w400),
          ),
          SizedBox(width: 22.w),
          SizedBox(
            width: 55.w,
            child: Text(cashback, style: TextStyleHelper.f12w400),
          ),
        ],
      ),
    );
  }
}
