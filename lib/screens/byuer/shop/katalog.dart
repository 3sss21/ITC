// import 'package:cashback_app/screens/bottomNavigation/myBottomNavigation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../seller/shop/catalog.dart';

// class CatalogScreen1 extends StatefulWidget {
//   const CatalogScreen1({Key? key}) : super(key: key);

//   @override
//   State<CatalogScreen1> createState() => _CatalogScreen1State();
// }

// class _CatalogScreen1State extends State<CatalogScreen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(100),
//           child: AppBar(
//             backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
//             title: const Text(
//               '      КАТАЛОГ',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//             ),
//             centerTitle: false,
//             actions: [
//               Image.asset("assets/images/feliz_logo.png"),
//               SizedBox(
//                 width: 20.w,
//                 child: Text(""),
//               ),
//             ],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//         body: Column(children: [
//           SizedBox(
//             height: 39.h,
//           ),
//           SearchField(),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 21,
//               right: 20,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 57.h,
//                       width: 21.w,
//                     ),
//                     const CatalogButton(
//                       titleOfCatalog: "Koфе",
//                     ),
//                     SizedBox(height: 53.h),
//                     const CatalogButton(
//                       titleOfCatalog: "Koфе",
//                     ),
//                     SizedBox(height: 53.h),
//                     const CatalogButton(
//                       titleOfCatalog: "Koфе",
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 57.h,
//                       width: 21.w,
//                     ),
//                     const CatalogButton(
//                       titleOfCatalog: "Лимонады",
//                     ),
//                     SizedBox(height: 53.h),
//                     const CatalogButton(
//                       titleOfCatalog: "Лимонады",
//                     ),
//                     SizedBox(height: 53.h),
//                     const CatalogButton(
//                       titleOfCatalog: "Лимонады",
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ]),
//           bottomNavigationBar: CustomBottomNavigator(currentPage: 2),
//         );
//   }
// }
