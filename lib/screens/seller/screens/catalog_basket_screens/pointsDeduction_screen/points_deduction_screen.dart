import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/product_cost_cashback.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/titles.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/total_cost.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/pointsDeduction_screen/payment_sreen_with_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsDeductionScreen extends StatefulWidget {
  const PointsDeductionScreen({Key? key}) : super(key: key);

  @override
  State<PointsDeductionScreen> createState() => _PointsDeductionScreenState();
}

class _PointsDeductionScreenState extends State<PointsDeductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppCoverWidget(
              nameCover: 'КОРЗИНА',
              isSeller: true,
              isBackButton: true,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.w, top: 82.h),
              child: Container(
                alignment: Alignment.topCenter,
                width: 334.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: ThemeHelper.brown80,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 38.w,
                      height: 17.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Titles(),
                            SizedBox(height: 14.63.h),
                            SizedBox(
                              width: 266.w,
                              height: 158.h,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: 30,
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
                            ),
                          ],
                        ),
                        TotalCost(
                          product: 'итого'.toUpperCase(),
                          cost: '280 сом',
                          cashback: '+18 баллов',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Padding(
              padding: EdgeInsets.only(left: 113.w, top: 23.h),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(23, 69, 59, 0.25),
                      blurRadius: 20.r,
                    ),
                  ],
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      primary: ThemeHelper.white,
                      maximumSize: Size(150.w, 40.h),
                      minimumSize: Size(150.w, 40.h),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentWithApp(),
                        ),
                      );
                    },
                    child: Text(
                      "Далее",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ThemeHelper.brown80,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: SellerNavigationWidget(currentIndex: 1),
    );
  }
}
