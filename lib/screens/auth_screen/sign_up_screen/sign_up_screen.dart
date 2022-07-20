import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  final bool isUser;
  const SignUpScreen({Key? key, required this.isUser}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: <Widget>[
            const FelizLogoWidget(),
            Positioned(
              top: 196.h,
              left: 37.w,
              right: 37.w,
              child: AuthBoxWidget(
                functionBox: 'Пройдите пожалуйста регистрацию',
                listWidgets: [
                  SizedBox(height: 33.h),
                  const AuthTextFieldWidget(
                    hintext: "Адрес электронной почты",
                  ),
                  SizedBox(height: 23.h),
                  const AuthTextFieldWidget(
                    hintext: "Номер телефона",
                  ),
                  SizedBox(height: 18.h),
                  const AuthTextFieldWidget(
                    hintext: "Пароль",
                  ),
                  SizedBox(height: 18.h),
                  const AuthTextFieldWidget(
                    hintext: "Повторите пароль",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 23.h, bottom: 32.h),
                    child: AuthButtonWidget(
                      txtButton: 'ЗАРЕГИСТРИРОВАТЬСЯ',
                      function: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(isUser: widget.isUser,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthBoxWidget extends StatelessWidget {
  final String functionBox;
  final List<Widget>? listWidgets;
  const AuthBoxWidget({
    Key? key,
    required this.functionBox,
    required this.listWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ThemeHelper.green80,
      ),
      child: Column(
        children: [
          SizedBox(height: 50.h),
          SizedBox(
            width: 270.w,
            child: Text(
              "Добро пожаловать в cashback-сервис \n FELIZ",
              textAlign: TextAlign.center,
              style: TextStyleHelper.authBox,
            ),
          ),
          SizedBox(height: 29.h),
          SizedBox(
            width: 270.w,
            child: Text(
              functionBox,
              textAlign: TextAlign.center,
              style: TextStyleHelper.functionBox,
            ),
          ),
          Column(
            children: listWidgets!,
          ),
        ],
      ),
    );
  }
}
