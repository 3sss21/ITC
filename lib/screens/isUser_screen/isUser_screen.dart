import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/screens/auth_screen/auth_screen.dart';
import 'package:cashback_app/screens/seller/screens/branch_screen/local_widget/branch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsUserScreen extends StatelessWidget {
  const IsUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const FelizLogoWidget(),
          Positioned(
            top: 248.h,
            left: 37.w,
            right: 37.w,
            child: Column(
              children: [
                Text(
                  "Кто вы?",
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeHelper.green80,
                  ),
                ),
                SizedBox(height: 43.h),
                BranchButton(
                  fontSize: 20,
                  width: 300,
                  height: 100,
                  titleOfBranch: "Я покупатель",
                  function: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(isUser: true),
                    ),
                  ),
                ),
                SizedBox(height: 43.h),
                BranchButton(
                  fontSize: 20,
                  width: 300,
                  height: 100,
                  titleOfBranch: "Я продавец",
                  function: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(isUser: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
