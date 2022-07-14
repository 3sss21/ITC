import 'package:cashback_app/screens/auth_screen/sign_in/auth.dart';
import 'package:cashback_app/screens/auth_screen/sign_in/sign_in.dart';
import 'package:cashback_app/screens/auth_screen/sign_up/sign_up.dart';
import 'package:cashback_app/screens/bottomNavigation/myBottomNavigation.dart';
import 'package:cashback_app/screens/bottomNavigation/userBottomNavigation.dart';
import 'package:cashback_app/screens/seller/basket/screen_2.dart';
import 'package:cashback_app/screens/splash/splash_screen.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Basket1 (),
      ),
    );
  }
}
