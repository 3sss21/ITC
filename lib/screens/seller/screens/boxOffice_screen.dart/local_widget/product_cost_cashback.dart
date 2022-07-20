import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCostCashback extends StatelessWidget {
  final String product;
  final String cost;
  final String cashback;
  const ProductCostCashback({
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
            width: 97.w,
            child: Text(product, style: TextStyleHelper.f12w400),
          ),
          const Spacer(),
          SizedBox(
            width: 71.w,
            child: Text(cost, style: TextStyleHelper.f12w400),
          ),
          const Spacer(),
          SizedBox(
            width: 51.w,
            child: Text(cashback, style: TextStyleHelper.f12w400),
          ),
        ],
      ),
    );
  }
}
