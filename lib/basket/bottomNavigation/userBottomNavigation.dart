// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../byuer/balance/balance.dart';
// import '../seller/shop/catalog.dart';

// class BottomNavigationBarWidget extends StatefulWidget {
//   const BottomNavigationBarWidget({Key? key, })
//       : super(key: key);

//   @override
//   State<BottomNavigationBarWidget> createState() =>
//       _BottomNavigationWidgetState();
// }

// class _BottomNavigationWidgetState extends State<BottomNavigationBarWidget> {
//  int _selectedIndex=0;


//   void _onItemTapped(int index) {
//  setState(() {
//         _selectedIndex = index;
//         print(index);
//  });
//   }


//  List<Widget> _widgetOptions = <Widget>[
//     // const ShopPage(),
//    CatalogScreen(),
//    BalanceScreen(),
//   ];

 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(10),
//         ),
//         child: Theme(
//           data: Theme.of(context).copyWith(
//             canvasColor: const Color(0xff17453B),
//           ),
//           child: BottomNavigationBar(
//             showUnselectedLabels: false,
//             showSelectedLabels: false,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white,
//             iconSize: 40,
//             items: [
//               BottomNavigationBarItem(
//                   activeIcon: Image.asset(
//                     "assets/images/shop.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.white,
//                   ),
//                   icon: Image.asset(
//                     "assets/images/shop.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.grey,
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   activeIcon: Image.asset(
//                     "assets/images/balance.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.white,
//                   ),
//                   icon: Image.asset(
//                     "assets/images/balance.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.grey,
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   activeIcon: Image.asset(
//                     "assets/images/qr-code.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.white,
//                   ),
//                   icon: Image.asset(
//                     "assets/images/qr-code.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.grey,
//                   ),
//                   label: ""),
//               BottomNavigationBarItem(
//                   activeIcon: Image.asset(
//                     "assets/images/profile.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.white,
//                   ),
//                   icon: Image.asset(
//                     "assets/images/profile.png",
//                     height: 30.h,
//                     width: 30.w,
//                     color: Colors.grey,
//                   ),
//                   label: ""),
//             ],
//             type: BottomNavigationBarType.fixed,
//             currentIndex: _selectedIndex,
//             onTap: _onItemTapped,
//           ),
//         ),
//       ),
//     );
//   }
// }

