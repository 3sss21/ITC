import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
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
      body: Column(
        children: [
          const AppCoverWidget(
            nameCover: "Корзина",
            isSeller: true,
            isBackButton: true,
          ),
          SizedBox(height: 82.h),
          Container(
            alignment: Alignment.topCenter,
            width: 334.w,
            height: 300.h,
            decoration: BoxDecoration(
              color: ThemeHelper.brown80,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Итого 450 сом",
                  style: TextStyle(
                    color: ThemeHelper.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Баланс 45 баллов",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "Укажите сколько баллов списать:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Text(
                        "Баллы: ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
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
                      padding: EdgeInsets.only(left: 11.w, top: 23.h),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadowHelper.boxShadow25,
                          ],
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              primary: ThemeHelper.white,
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
                            child: Text(
                              "OK",
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
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 29.h),
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
                        "Оплатить",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ThemeHelper.brown80,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
