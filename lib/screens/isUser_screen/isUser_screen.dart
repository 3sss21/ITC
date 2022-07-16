import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
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
            top: 196.h,
            left: 37.w,
            child: Column(
              children: [
                Text(
                  "Выбирите филиал",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: ThemeHelper.green80,
                  ),
                ),
                SizedBox(height: 43.h),
                BranchButton(
                  titleOfBranch: "БЦ Олимп",
                  function: () {},
                ),
                SizedBox(height: 43.h),
                BranchButton(
                  titleOfBranch: "БЦ Олимп",
                  function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}