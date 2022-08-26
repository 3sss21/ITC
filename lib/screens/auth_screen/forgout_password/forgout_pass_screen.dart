import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/txtBtnBack_widget.dart';
import 'package:cashback_app/screens/auth_screen/forgout_password/receivedEmail_screen.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgoutPasswordScreen extends StatelessWidget {
  const ForgoutPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const FelizLogoWidget(),
          Positioned(
            top: 265.5.h,
            left: 38.w,
            right: 38.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TxtBtnBackWidget(function: () => Navigator.pop(context)),
                SizedBox(height: 11.5.w),
                Container(
                  width: 300.w,
                  height: 238.h,
                  decoration: BoxDecoration(
                    color: ThemeHelper.green80,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [BoxShadowHelper.boxShadow10],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 30.h),
                    child: Column(
                      children: [
                        Text(
                          'Введите E-mail',
                          style: TextStyleHelper.f20w700,
                        ),
                        SizedBox(height: 40.w),
                        const AuthTextFieldWidget(
                          hintext: "E-mail",
                        ),
                        SizedBox(height: 30.w),
                        AuthButtonWidget(
                          width: 98,
                          txtButton: 'Далее',
                          function: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReceivedEmailScreen(),
                            ),
                          ),
                        ),
                      ],
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
