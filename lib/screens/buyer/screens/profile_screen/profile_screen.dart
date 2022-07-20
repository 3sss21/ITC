import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/local_widgets/custom_button.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/local_widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppCoverWidget(nameCover: 'ПРОФИЛЬ'),
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
              child: Column(
                children: [
                  const Data(
                    titleOfData: 'Имя:',
                    data: '________________________________',
                  ),
                  SizedBox(height: 20.h),
                  const Data(
                    titleOfData: 'email:',
                    data: '________________________________',
                  ),
                  SizedBox(height: 20.h),
                  const Data(
                    titleOfData: 'Номер телефона:',
                    data: '_______________________',
                  ),
                  SizedBox(height: 20.h),
                  const Data(
                    titleOfData: 'Пароль:',
                    data: '____________________________',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 95,
                      left: 56,
                    ),
                    child: Row(
                      children: [
                        const CustomButton(buttonText: 'Изменить'),
                        SizedBox(width: 19.w),
                        const CustomButton(buttonText: 'Сохранить')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BuyerNavigationWidget(currentIndex: 3),
    );
  }
}
