import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppCoverWidget(nameCover: "Profile"),
            SizedBox(height: 79.h),
            Container(
              width: 334.w,
              height: 397.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ThemeHelper.green80,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 32.w,
                  right: 32.w,
                  top: 119.h,
                ),
                child: Column(
                  children: [
                    ChangeInfoTextFieldWidget(
                      valueTextField: 'Имя',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      valueTextField: 'email',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      valueTextField: 'Номер телефона',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      valueTextField: 'Пароль',
                      controller: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
