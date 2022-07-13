import 'package:cashback_app/screens/bottomNavigation/myBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    customFunction();
    super.initState();
  }

  customFunction() async {
    var box = Hive.box('tokenBox');
    String token = box.get('token', defaultValue: '');

    await Future.delayed(Duration(seconds: 3));

    if (token == '') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyBottomNavigation()));
    } else {
      Future.delayed(Duration(seconds: 3));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyBottomNavigation()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(width: 1.sw, height: 1.sh,child: Image.asset("assets/images/splash.jpg",fit: BoxFit.cover,),),
    );
  }
}