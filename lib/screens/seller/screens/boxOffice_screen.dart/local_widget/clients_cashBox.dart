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
      height: 149.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ThemeHelper.brown80,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        child: Column(
          children: [
            Column(
              children: [
                const Titles(),
                SizedBox(
                  height: 70.h,
                  width: 280.w,
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const ProductCostCashback(
                        product: 'IceTea (зеленый)',
                        cost: '90 сом',
                        cashback: '9 баллов',
                      );
                    },
                  ),
                ),
              ],
            ),
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
