import 'package:cashback_app/global_widgets/appCover_widget.dart';
import 'package:cashback_app/screens/byuer/screens/profile_screen/local_widget/custom_button.dart';
import 'package:cashback_app/screens/byuer/screens/profile_screen/local_widget/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          AppCoverWidget(nameCover: "Profile"),
          SizedBox(
            height: 79.h,
          ),
          Container(
            width: 334.w,
            height: 397.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(23, 69, 59, 0.8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 36, top: 119),
              child: Column(children: [
                ProfileField(
                  titleOfFIeld: "Имя: ",
                  data: " _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
                ),
                SizedBox(height: 20,),
                ProfileField(
                  titleOfFIeld: "email: ",
                  data: "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _",
                ),
                     SizedBox(height: 20,),
                ProfileField(
                  titleOfFIeld: "Номер телефона: ",
                  data: "_ _ _ _ _ _ _ _ _",
                ),
                     SizedBox(height: 20,),
                ProfileField(
                  titleOfFIeld: "Пароль: ",
                  data: " _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
                ), 
                SizedBox(height: 100.h,),
                Padding(
                  padding: const EdgeInsets.only(left:40),
                  child: Row(
                    children: [
                      CustomButton1(buttonText: "ИЗМЕНИТЬ",),
                      SizedBox(width: 32.w,),
                          CustomButton1(buttonText: "ИЗМЕНИТЬ",),
                    ],
                  ),
                ),

              ]),
            ),
          ),
        ],
      ),
    );
  }
}
