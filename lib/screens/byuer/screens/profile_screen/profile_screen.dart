import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/byuer/screens/profile_screen/local_widget/custom_button.dart';
import 'package:cashback_app/screens/byuer/screens/profile_screen/local_widget/changeInfoTextField_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSceen extends StatefulWidget {
  const ProfileSceen({Key? key}) : super(key: key);

  @override
  State<ProfileSceen> createState() => _ProfileSceenState();
}

class _ProfileSceenState extends State<ProfileSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(nameCover: "Profile"),
          SizedBox(height: 79.h),
          Container(
            width: 334.w,
            height: 397.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeHelper.green80,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 36, top: 119),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ChangeInfoTextFieldWidget(
                      controller: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
