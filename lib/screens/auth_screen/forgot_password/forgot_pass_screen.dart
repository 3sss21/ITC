import 'package:cashback_app/commons/box_shadow_helper.dart';
import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/txtBtnBack_widget.dart';
import 'package:cashback_app/screens/auth_screen/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordBloc forgotPasswordBloc;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();

  @override
  void initState() {
    forgotPasswordBloc = ForgotPasswordBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      bloc: forgotPasswordBloc,
      builder: (context, state) {
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
                              'Введите e-mail',
                              style: TextStyleHelper.f20w700,
                            ),
                            SizedBox(height: 40.w),
                            AuthTextFieldWidget(
                              onPressed: () {
                                setState(() {
                                  emailKey.currentState?.reset();
                                });
                              },
                              hintext: "felizCoffee@gmail.com",
                              textInputType: TextInputType.emailAddress,
                              controller: emailController,
                              isObsecuredText: false,
                              isClosedEye: false,
                              isSuffixIcon: false,
                              validate: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !EmailValidator.validate(value)) {
                                  return 'Введите правильный адрес эл. почты';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 30.w),
                            AuthButtonWidget(
                              width: 98.w,
                              txtButton: 'Далее',
                              textColor: ThemeHelper.green80,
                              themeButton: ThemeHelper.white,
                              function: () {
                                FocusScope.of(context).unfocus();
                                emailKey.currentState?.validate();
                                if (emailKey.currentState?.validate() == true) {
                                  forgotPasswordBloc.add(
                                    GetForgotPasswordEvent(
                                      email: emailController.text,
                                    ),
                                  );
                                } else {
                                  return null;
                                }
                              },
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
      },
    );
  }
}
