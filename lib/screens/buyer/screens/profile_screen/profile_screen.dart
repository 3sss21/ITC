import 'package:cashback_app/commons/icon_images.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/local_widget/changeInfoTextField_widget.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/local_widget/profileChangeButton_widget.dart';
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
            const AppCoverWidget(
              nameCover: "Profile",
              isSeller: false,
            ),
            SizedBox(height: 79.h),
            Container(
              width: 334.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ThemeHelper.green80,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 32.w,
                  right: 32.w,
                  top: 70.h,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'Изменить',
                                style: TextStyleHelper.changeProfile,
                              ),
                              SizedBox(width: 12.w),
                              ImageIcon(
                                AssetImage(IconsImages.changeIcon),
                                size: 19,
                                color: ThemeHelper.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      width: 217,
                      valueTextField: 'Имя',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      width: 210,
                      valueTextField: 'email',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      width: 123,
                      valueTextField: 'Номер телефона',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20.h),
                    ChangeInfoTextFieldWidget(
                      width: 193,
                      valueTextField: 'Пароль',
                      controller: TextEditingController(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 94.h, bottom: 30.h),
                      child: ProfileChangeButtonWidget(
                        buttonText: 'Сохранить',
                        onTapFunction: () {},
                      ),
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
