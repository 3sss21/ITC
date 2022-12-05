import 'package:cashback_app/models/user_data_model.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/splash_screen/splash_screen.dart';
//Bismillah

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  await Hive.openBox('userIdBox');
  await Hive.openBox('pincodeBox');
  await Hive.openBox('emailBox');
  await Hive.openBox<dynamic>('userDataBox');
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
        title: 'Feliz Logo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        //     const ConfirmScreen(
        //   email: 'kaparovkanagat@gmail.com',
        //   pinCode: '',
        // ),
        //ForgotPasswordScreen()
        //    const  BuyerNavigationWidget(
        //   currentIndex: 3,
        // )
      ),
    );
  }
}
