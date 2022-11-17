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
  late int finalPrice;
  late int balance;
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
            width: 334.r,
            height: 300.r,
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
                  "Итого $finalPrice сом",
                  style: TextStyle(
                    color: ThemeHelper.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Баланс $balance баллов",
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
                    Text(
                      "Баллы: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 60.r,
                      height: 26.r,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        cursorColor: ThemeHelper.white,
                        style: TextStyle(color: ThemeHelper.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ThemeHelper.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ThemeHelper.white),
                          ),
                          focusColor: ThemeHelper.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 11.w),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          backgroundColor: ThemeHelper.white,
                          maximumSize: Size(80.w, 32.h),
                          minimumSize: Size(80.w, 32.h),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentWithApp(),
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
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 5.w,
                    top: 29.h,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      backgroundColor: ThemeHelper.white,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
