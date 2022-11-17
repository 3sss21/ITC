import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/product_cost_cashback.dart';
import 'package:cashback_app/screens/seller/screens/boxOffice_screen.dart/local_widget/titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppCoverWidget(
            nameCover: 'Корзина',
            isSeller: true,
            isBackButton: true,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 21.w,
              top: 82.h,
            ),
            child: Container(
              alignment: Alignment.topCenter,
              width: 334.r,
              height: 300.r,
              decoration: BoxDecoration(
                color: ThemeHelper.brown80,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 38.w,
                    // height: 17.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Titles(),
                          SizedBox(
                            width: 266.r,
                            height: 158.r,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 30,
                                    itemBuilder: (context, index) {
                                      return const ProductCostCashback(
                                        product: 'IceTea (зеленый)',
                                        cost: '90 сом',
                                        cashback: 9,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ProductCostCashback(
                        product: 'итого'.toUpperCase(),
                        cost: '280 сом',
                        cashback: 18,
                        isHasPlus: true,
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
            padding: EdgeInsets.only(left: 113.w),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(23, 69, 59, 0.25),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: const Color.fromRGBO(255, 255, 255, 1),
                    maximumSize: Size(150.w, 40.h),
                    minimumSize: Size(150.w, 40.h),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "оплатить",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 42, 42, 0.8),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
