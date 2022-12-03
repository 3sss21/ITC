// // import 'package:cashback_app/screens/auth_screen/sign_in/sign_in.dart';
// // import 'package:cashback_app/screens/auth_screen/sign_up/sign_up.dart';
// // import 'package:cashback_app/screens/seller/basket/seller_basket.dart';
// // import 'package:cashback_app/screens/seller/income/screen_1.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // import '../seller/branch/choose_branch.dart';
// // import '../seller/shop/catalog.dart';

// // class MyBottomNavigation extends StatefulWidget {
// //   const MyBottomNavigation({Key? key}) : super(key: key);

// //   @override
// //   State<MyBottomNavigation> createState() => _MyBottomNavigationState();
// // }

// // class _MyBottomNavigationState extends State<MyBottomNavigation> {
// //   int _selectIndex = 0;

// //   void _onItemTapped(int index) {
// //  setState(() {
// //         _selectIndex = index;
// //         print(index);
// //  });
// //   }

// //   List<Widget> _widgetOptions = <Widget>[
// //     BranchScreen(),
// //     SignUpScreen(),
// //     Basket(),
// //     Income1()
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _widgetOptions.elementAt(_selectIndex),
// //       bottomNavigationBar: BottomNavigationBar(
// //         iconSize: 10.0,
// //         selectedIconTheme: IconThemeData(color: Color(0xff22A2BD)),
// //         unselectedIconTheme: IconThemeData(color: Color(0xffBDBDBD)),
// //         backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
// //         selectedLabelStyle: TextStyle(fontSize: 12, color: Color(0xff22A2BD)),
// //         items: <BottomNavigationBarItem>[
// //           BottomNavigationBarItem(
// //               activeIcon: Image.asset(
// //                 "assets/images/branch.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //                 color: Colors.white,
// //               ),
// //               icon: Image.asset(
// //                 "assets/images/branch.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //                 color: Colors.grey,
// //               ),
// //               label: ""),
// //           BottomNavigationBarItem(
// //               activeIcon: Image.asset(
// //                 "assets/images/clients.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //                 color: Colors.white,
// //               ),
// //               icon: Image.asset(
// //                 "assets/images/clients.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //                 color:  Colors.grey,
// //               ),
// //               label: "",
// //               ),
// //           BottomNavigationBarItem(
// //               activeIcon: Image.asset(
// //                 "assets/images/shop.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //                 color: Colors.white,
// //               ),
// //               icon: Image.asset(
// //                 "assets/images/shop.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //                 color:Colors.grey,
// //               ),
// //               label: "",
// //               ),
// //           BottomNavigationBarItem(
// //               activeIcon: Image.asset(
// //                 "assets/images/income.png",
// //                 color: Colors.white,
// //                 height: 30.h,
// //                 width: 30.w,
// //               ),
// //               icon: Image.asset(
// //                 "assets/images/income.png",
// //                 height: 30.h,
// //                 width: 30.w,
// //             color: Colors.grey,
// //               ),
// //               label: "",),
// //         ],
// //         currentIndex: _selectIndex,
// //         onTap: _onItemTapped,
// //         type: BottomNavigationBarType.fixed,
// //       ),
// //     );
// //   }
// // }
