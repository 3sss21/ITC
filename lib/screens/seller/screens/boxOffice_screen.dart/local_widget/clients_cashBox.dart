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
      width: 334.r,
      height: 156.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ThemeHelper.brown80,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 15.h,
        ),
        child: Column(
          children: [
            Column(
              children: [
                const Titles(),
                SizedBox(
                  height: 70.r,
                  width: 280.r,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 0.h),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const ProductCostCashback(
                        product: 'IceTea (зеленый)',
                        cost: '90 сом',
                        cashback: 288,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ProductCostCashback(
              product: 'итого'.toUpperCase(),
              cost: '280 сом',
              cashback: 182222,
            ),
          ],
        ),
      ),
    );
  }
}
