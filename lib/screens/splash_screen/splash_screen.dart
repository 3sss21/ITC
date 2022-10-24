import 'package:cashback_app/screens/auth_screen/auth_screen.dart';
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
    navigate();
    super.initState();
  }

  Future navigate() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthScreen(),
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
    return MaterialApp(
      
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 242.w,
            height: 242.h,
            child: Center(
              child: Image.asset('assets/images/splash_page.png'),
            ),
          ),
        ),
      ),
    );
  }
}
