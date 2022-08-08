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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color.fromRGBO(83, 42, 42, 0.8),
          title: const Text(
            '      КОРЗИНА',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          centerTitle: false,
          actions: [
            Image.asset("assets/images/feliz_logo.png"),
            SizedBox(
              width: 20.w,
              child: Text(""),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 21,
              top: 28,
            ),
            child: Container(
              alignment: Alignment.topCenter,
              width: 334.w,
              height: 310.h,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(83, 42, 42, 0.8),
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    SizedBox(
                      width: 18.w,
                      height: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 17.h,
                        ),
                        const Text(
                          "Наименование",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        
                    Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.h,
                              width: 85.w,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 10),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return ProductName();
                                },
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Итого",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              fontWeight: FontWeight.w600),
                        )
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
                        const Text(
                          "Смоимость",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.h,
                              width: 85.w,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 10),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return ProductCost();
                                },
                              ),
                            ),
                          ],
                        ),
                      
                        const Text(
                          "450 сом",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 0.8),
                              fontWeight: FontWeight.w600),
                        )
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
                        const Text(
                          "Кэшбек",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                       
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.h,
                              width: 85.w,
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 10),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return ProductCashback();
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
