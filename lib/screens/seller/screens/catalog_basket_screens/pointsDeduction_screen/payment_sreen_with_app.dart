import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentWithApp extends StatefulWidget {
  const PaymentWithApp({Key? key}) : super(key: key);

  @override
  State<PaymentWithApp> createState() => _PaymentWithAppState();
}

class _PaymentWithAppState extends State<PaymentWithApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppCoverWidget(nameCover: "Корзина", isSeller: true),
        SizedBox(
          height: 82.h,
        ),
        Container(
          alignment: Alignment.topCenter,
          width: 334.w,
          height: 310.h,
          decoration: BoxDecoration(
              color: Color.fromRGBO(83, 42, 42, 0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Итого 450 сом",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Баланс 45 баллов",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Укажите сколько баллов списать:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                SizedBox(height: 20.h,
                  child: Text(
                    "Баллы: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      fillColor: Colors.white,
                      labelText: ' ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11, top: 23),
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
                          maximumSize: Size(80.w, 32.h),
                          minimumSize: Size(80.w, 32.h),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentWithApp(),
                            ),
                          );
                        },
                        child: const Text(
                          "OK",
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
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 23),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentWithApp(),
                        ),
                      );
                    },
                    child: const Text(
                      "Оплатить",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 42, 42, 0.8),
                      ),
                    )),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
