import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/payment_screen/local_widgets/titles.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/payment_screen/local_widgets/total_cost.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/pointsDeduction_screen/bakset_widgets.dart';
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
          const AppCoverWidget(nameCover: 'Корзина', isSeller: true),
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 28.h),
            child: Container(
              alignment: Alignment.topCenter,
              width: 334.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: ThemeHelper.brown80,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    SizedBox(
                      width: 18.w,
                      height: 17.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Titles(title: 'Наименование'),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.h,
                              width: 85.w,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 10.h),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return const ProductName();
                                },
                              ),
                            ),
                          ],
                        ),
                        TotalCost(
                          totalCost: 'итого'.toUpperCase(),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Titles(title: 'Стоимость'),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.h,
                              width: 85.w,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 10.h),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return const ProductCost();
                                },
                              ),
                            ),
                          ],
                        ),
                        Text("450 сом", style: TextStyleHelper.f12w400),
                      ],
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 17.h,
                        ),
                        const Titles(title: 'Кэшбек'),
                        Column(
                          children: [
                            SizedBox(
                              height: 150.h,
                              width: 85.w,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 10.h),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return const ProductCashback();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Text(
                          "36 баллов",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 113),
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
