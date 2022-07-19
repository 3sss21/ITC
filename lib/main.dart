import 'package:cashback_app/screens/byuer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/byuer/screens/balance_screen/balance_screen.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:cashback_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CashBack',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SellerNavigationWidget(currentIndex: 3,)
      ),
    );
  }
}

