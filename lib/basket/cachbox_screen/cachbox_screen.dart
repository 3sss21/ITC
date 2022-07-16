// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CachboxScreen extends StatefulWidget {
//   const CachboxScreen({Key? key}) : super(key: key);

//   @override
//   State<CachboxScreen> createState() => _CachboxScreenState();
// }

// class _CachboxScreenState extends State<CachboxScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100),
//         child: AppBar(
//           backgroundColor: Color.fromRGBO(23, 69, 59, 0.8),
//           title: const Text(
//             '      КАССА',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//           ),
//           actions: [
//             Padding(
//               padding:  EdgeInsets.only(right: 20.w),
//               child: Image.asset("assets/images/feliz_logo.png"),
//             ),
//             // SizedBox(
//             //   width: 20.w,
//             //   child: Text(""),
//             // ),
//           ],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 21),
//         child: SingleChildScrollView(
//           child: Column(children: [
//             SizedBox(
//               height: 22.h,
//             ),
//             SizedBox(
//               width: 334.w,
//               height: 38.h,
//               child: TextField(
//                   style: const TextStyle(
//                     fontSize: 25.0,
//                     color: Color.fromRGBO(23, 69, 59, 0.8),
//                   ),
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color.fromRGBO(23, 69, 59, 0.2),
//                       contentPadding:
//                           EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                       hintText: "DD/MM/YY",
//                       hintStyle: TextStyle(
//                           color: Color.fromRGBO(23, 69, 59, 0.8), fontSize: 20),
//                       border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.blueAccent, width: 32.0),
//                           borderRadius: BorderRadius.circular(25.0)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromRGBO(23, 69, 59, 0.8)),
//                           borderRadius: BorderRadius.circular(25.0)))),
//             ),
//             SizedBox(
//               height: 51.h,
//             ),
//             SizedBox(
//               width: 1.sw,
//               height: 1.sh,
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: HistoryButton(),
//                   );
//                 },
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class HistoryButton extends StatelessWidget {
//   const HistoryButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(23, 69, 59, 0.25),
//             blurRadius: 12,
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           primary: const Color.fromRGBO(255, 255, 255, 1),
//           maximumSize: Size(334.w, 40.h),
//           minimumSize: Size(334.w, 40.h),
//         ),
//         onPressed: () {},
//         child: Row(children: [
//           SizedBox(
//             width: 33.w,
//           ),
//           const Text(
//             "06.06.22",
//             style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Color.fromRGBO(23, 69, 59, 0.8)),
//           ),
//           SizedBox(
//             width: 120.w,
//           ),
//           const Text(
//             "+80.00",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//               color: Color.fromRGBO(255, 214, 0, 1),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
