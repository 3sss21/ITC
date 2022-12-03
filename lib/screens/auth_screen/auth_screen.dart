import 'package:cashback_app/commons/images_helper.dart';
import 'package:cashback_app/commons/text_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/sign_up_screen.dart';
import 'package:cashback_app/screens/buyer/screens/branch_screen/local_widget/branch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 37.w, right: 37.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 212.h),
              SizedBox(
                width: 150.w,
                height: 150.h,
                child: Image.asset(
                  ImageHelper.felizLogo,
                  color: ThemeHelper.green80,
                ),
              ),
              SizedBox(height: 98.h),
              SizedBox(
                width: 300.w,
                child: Text(
                  TextHelper.authDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeHelper.green80,
                  ),
                ),
              ),
              SizedBox(height: 36.h),
              BranchButton(
                fontSize: 20.sp,
                width: 300.w,
                height: 50.h,
                titleOfBranch: "ВХОД",
                function: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              BranchButton(
                fontSize: 20.sp,
                width: 300.w,
                height: 50.h,
                titleOfBranch: "ЗАРЕГИСТРИРОВАТЬСЯ",
                function: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
