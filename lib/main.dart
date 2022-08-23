<<<<<<< HEAD
=======
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/seller/screens/catalog_basket_screens/catalog_screen/catalog_screen.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
>>>>>>> d9d046e37d0a194d33bf2659f53c361cb03aacaf
import 'package:cashback_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("tokenBox");
  await Hive.openBox("phoneNumberBox");

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
        home: const 
<<<<<<< HEAD
        SplashScreen(),
       
        // SellerNavigationWidget(currentIndex: 2)
=======
        // CatalogScreen(),
        // SplashScreen(),
        BuyerNavigationWidget(currentIndex: 0),
        // SellerNavigationWidget(currentIndex: 0)
>>>>>>> d9d046e37d0a194d33bf2659f53c361cb03aacaf
      ),
    );
  }
}

