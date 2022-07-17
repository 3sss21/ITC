// import 'package:cashback_app/screens/seller/branch/choose_branch.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive/hive.dart';

// import '../bottomNavigation/myBottomNavigation.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   bool get nim => true;

//   @override
//   void initState() {
//     String nim = "12";
//      customFunction();
//     super.initState();
//   }

//   customFunction() async {
//     //   var box = Hive.box('tokenBox');
//     //   String token = box.get('token', defaultValue: '');

//     await Future.delayed(Duration(seconds: 3));

//     if (nim != true) {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => BranchScreen()));
//     } else {
//       Future.delayed(Duration(seconds: 3));
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => BranchScreen()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         width: 300.w,
//         height: 300.h,
//         child: Image.asset(
//           "assets/images/Vector.png",
//           fit: BoxFit.cover,
//         ),
//       )),
//     );
//   }
// }
