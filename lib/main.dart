import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/profile_screen.dart';
import 'package:cashback_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/auth_screen/confirm_code_screen/confirm_password_screen.dart';
import 'screens/seller/seller_navigation/seller_navigation_widget.dart';
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
          primarySwatch: Colors.brown,
        ),
        home:CustomBottomNavigator(currentPage: 0,)
            //const BuyerNavigationWidget(currentIndex: 3),
           // const SplashScreen()
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
