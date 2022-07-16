// import 'package:cashback_app/commons/theme_helper.dart';
// import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BranchScreen extends StatefulWidget {
//   const BranchScreen({Key? key}) : super(key: key);

//   @override
//   State<BranchScreen> createState() => _BranchScreenState();
// }

// class _BranchScreenState extends State<BranchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           const FelizLogoWidget(),
//           Positioned(
//             top: 196.h,
//             left: 37.w,
//             child: Column(
//               children: const [
//                 Text(
//                   "Выбирите филиал",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w700,
//                     color: Color.fromRGBO(23, 69, 59, 0.8),
//                   ),
//                 ),
//                 SizedBox(height: 43),
//                 BranchButton(
//                   titleOfBranch: "БЦ Олимп",
//                 ),
//                 SizedBox(height: 43),
//                 BranchButton(titleOfBranch: "БЦ Олимп"),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavigator(currentPage: 0),
//     );
//   }
// }

// class BranchButton extends StatelessWidget {
//   final String titleOfBranch;
//   final Function() function;
//   const BranchButton({
//     Key? key,
//     required this.titleOfBranch,
//     required this.function,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(300.w, 100.h),
//         maximumSize: Size(300.w, 100.h),
//         primary: ThemeHelper.green80,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       onPressed: () => function,
//       child: Text(
//         titleOfBranch,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
