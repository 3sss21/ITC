// import 'dart:developer';

// import 'package:cashback_app/commons/text_style_helper.dart';
// import 'package:cashback_app/commons/theme_helper.dart';
// import 'package:cashback_app/global_widgets/btnTryAgain_widget.dart';
// import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
// import 'package:cashback_app/screens/auth_screen/auth_screen.dart';
// import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
// import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/user_id_bloc/bloc/user_id_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class UserIdRequest extends StatefulWidget {
//   const UserIdRequest({Key? key}) : super(key: key);

//   @override
//   State<UserIdRequest> createState() => _UserIdRequestState();
// }

// class _UserIdRequestState extends State<UserIdRequest> {
//   late UserIdBloc _userIdBloc;

//   @override
//   void initState() {
//     _userIdBloc = UserIdBloc();
//     _userIdBloc.add(GetUserIdEvent());
//     super.initState();
//   }

//   Future _exitApp() async {
//     Box token = Hive.box('tokenBox');
//     Box userId = Hive.box('userIdBox');
//     await token.deleteFromDisk();
//     await userId.deleteFromDisk();
//     // await Hive.initFlutter();
//     // await Hive.openBox('userIdBox');
//     // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
//     //     MaterialPageRoute(builder: (context) =>const  SignInScreen()),
//     //     (route) => false);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const SignInScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           SizedBox(
//             width: 76.w,
//             child: InkWell(
//               onTap: () {
//                 _exitApp();
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     'Выйти',
//                     style: TextStyleHelper.f16Green100,
//                   ),
//                   SizedBox(width: 5.w),
//                   Icon(
//                     Icons.exit_to_app_outlined,
//                     size: 20,
//                     color: ThemeHelper.green100,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: BlocConsumer<UserIdBloc, UserIdState>(
//         bloc: _userIdBloc,
//         listener: (context, state) {
//           if (state is ErrorUserIdState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                   state.message.toString(),
//                 ),
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is ErrorUserIdState) {
//             return Center(
//               child: ButtonTryAgainWidget(
//                   onTabFunction: () {
//                     _userIdBloc.add(GetUserIdEvent());
//                   },
//                   btnTheme: Colors.cyan),
//             );
//           }
//           if (state is LoadingUserIdState) {
//             return const Center(
//               child: LoadingIndicatorWidget(),
//             );
//           }

//           if (state is LoadedUserIdState) {
//             Box box = Hive.box("userIdBox");
//             box.put('user_id', state.userIdModelList.id);

//             print('User_Id ==== ${box.get('user_id')}');

//             return Center(child: Text(state.userIdModelList.id.toString()));
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }
// //0999665900