import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }

          if (state is AuthSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SizedBox(
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
                      AuthTextFieldWidget(
                        controller: emailController,
                        hintext: "Адрес электронной почты",
                      ),
                      SizedBox(height: 23.h),
                      AuthTextFieldWidget(
                        controller: phoneNumberController,
                        hintext: "Номер телефона",
                      ),
                      SizedBox(height: 18.h),
                      AuthTextFieldWidget(
                        controller: passwordController,
                        hintext: "Пароль",
                      ),
                      SizedBox(height: 18.h),
                      AuthTextFieldWidget(
                        controller: repeatPasswordController,
                        hintext: "Повторите пароль",
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 23.h, bottom: 32.h),
                        child: AuthButtonWidget(
                            txtButton: 'ЗАРЕГИСТРИРОВАТЬСЯ',
                            function: () {
                              authBloc.add(
                                GetSignUpEvent(
                                    email: emailController.text,
                                    phoneNumber: phoneNumberController.text,
                                    password: passwordController.text,
                                    repeatPassword:
                                        repeatPasswordController.text),
                               
                              );
                              print(emailController.text);
                              print(phoneNumberController.text);
                              print(passwordController.text);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
