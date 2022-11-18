import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCostCashback extends StatelessWidget {
  final String product;
  final String cost;
  final int cashback;
  final bool isHasPlus;

  const ProductCostCashback({
    Key? key,
    required this.product,
    required this.cost,
    required this.cashback,
    this.isHasPlus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 107.w,
            child: Text(
              product,
              style: TextStyleHelper.f12w400,
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              cost,
              style: TextStyleHelper.f12w400,
            ),
          ),
          SizedBox(
            width: 52.w,
            child: Text(
              isHasPlus ? '+ $cashback баллов' : '$cashback баллов',
              style: TextStyleHelper.f12w400,
            ),
          ),
        ],
      ),
    );
  }
}
