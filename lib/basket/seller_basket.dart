// import 'package:cashback_app/screens/seller/basket/screen_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Basket extends StatefulWidget {
//   const Basket({Key? key}) : super(key: key);

//   @override
//   State<Basket> createState() => _BasketState();
// }

// class _BasketState extends State<Basket> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100),
//         child: AppBar(
//           backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
//           title: const Text(
//             '      КОРЗИНА',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//           ),
//           centerTitle: false,
//           actions: [
//             Image.asset("assets/images/feliz_logo.png"),
//             SizedBox(
//               width: 20.w,
//               child: Text(""),
//             ),
//           ],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 31),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 230.h,
//             ),
//             BasketChoise(
//               basketChoise: "Сканировать QR-код",
//               isCamera: true,
//             ),
//             SizedBox(
//               height: 32,
//             ),
//             BasketChoise(
//               basketChoise: "Без приложения",
//               isCamera: false,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BasketChoise extends StatelessWidget {
//   final String basketChoise;
//   bool isCamera = true;
//   BasketChoise({
//     Key? key,
//     required this.basketChoise,
//     required this.isCamera,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 320.w,
//       height: 40.h,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Color.fromRGBO(255, 255, 255, 1),
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromRGBO(23, 69, 59, 0.25),
//               blurRadius: 20,
//             ),
//           ]),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 60, right: 13),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               basketChoise,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(23, 69, 59, 0.8)),
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Basket1(),
//                   ),
//                 );
//               },
//               icon: Icon(
//                 isCamera ? Icons.camera_alt_outlined : Icons.arrow_forward_ios,
//                 color: Color.fromRGBO(23, 69, 59, 0.8),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
