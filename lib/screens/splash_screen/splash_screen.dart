import 'package:cashback_app/screens/byuer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/isUser_screen/isUser_screen.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // customFunction();
    navigate();
    super.initState();
  }

  Future navigate() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const IsUserScreen(),
        // const SellerNavigationWidget(currentIndex: 0),
      ),
    );
  }
  // customFunction() async {
  //   var box = Hive.box('tokenBox');
  //   String token = box.get('token', defaultValue: '');

  //   await Future.delayed(const Duration(seconds: 3));

  //   if (token == '') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const BranchScreen(),
  //       ),
  //     );
  //   } else {
  //     Future.delayed(
  //       const Duration(seconds: 3),
  //     );
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const BranchScreen(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 242.w,
          height: 242.h,
          child: Center(
            child: Image.asset('assets/images/splash_page.png'),
          ),
        ),
      ),
    );
  }
}
