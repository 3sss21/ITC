import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/product_cost_cashback.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientsCashBox extends StatelessWidget {
  const ClientsCashBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ThemeHelper.green80,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        child: Column(
          children: [
            const Titles(),
            const ProductCostCashback(
              product: 'IceTea (зеленый)',
              cost: '90 сом',
              cashback: '9 баллов',
            ),
            const ProductCostCashback(
              product: 'IceTea (зеленый)',
              cost: '90 сом',
              cashback: '9 баллов',
            ),
            const ProductCostCashback(
              product: 'Сендвич',
              cost: '100 сом',
              cashback: '0 баллов',
            ),
            SizedBox(height: 7.h),
            ProductCostCashback(
              product: 'итого'.toUpperCase(),
              cost: '280 сом',
              cashback: '+18 баллов',
            ),
          ],
        ),
      ),
    );
  }
}
