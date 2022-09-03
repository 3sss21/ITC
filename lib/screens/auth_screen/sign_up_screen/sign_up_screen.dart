import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
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
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  late SignUpBloc signUpBloc;

  @override
  void initState() {
    signUpBloc = SignUpBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Stack(
                children: <Widget>[
                  const FelizLogoWidget(),
                  Positioned(
                    top: 196.h,
                    left: 37.w,
                    right: 37.w,
                    child: SingleChildScrollView(
                      child: AuthBoxWidget(
                        functionBox: 'Пройдите пожалуйста регистрацию',
                        listWidgets: [
                          SizedBox(height: 33.h),
                          AuthTextFieldWidget(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            hintext: "Адрес электронной почты",
                            isObsecuredText: false,
                            isSuffixIcon: false,
                            isClosedEye: false,
                          ),
                          SizedBox(height: 23.h),
                          AuthTextFieldWidget(
                            controller: userNameController,
                            textInputType: TextInputType.text,
                            hintext: "UserName",
                            isObsecuredText: false,
                            isSuffixIcon: false,
                            isClosedEye: false,
                          ),
                          SizedBox(height: 23.h),
                          AuthTextFieldWidget(
                            controller: phoneNumberController,
                            textInputType: TextInputType.number,
                            hintext: "Номер телефона",
                            isObsecuredText: false,
                            isSuffixIcon: false,
                            isClosedEye: false,
                          ),
                          SizedBox(height: 18.h),
                          AuthTextFieldWidget(
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            hintext: "Пароль",
                            isObsecuredText: true,
                            isSuffixIcon: true,
                            isClosedEye: true,
                          ),
                          SizedBox(height: 18.h),
                          AuthTextFieldWidget(
                            controller: repeatPasswordController,
                            textInputType: TextInputType.text,
                            hintext: "Повторите пароль",
                            isObsecuredText: true,
                            isSuffixIcon: true,
                            isClosedEye: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 23.h, bottom: 32.h),
                            child: BlocConsumer<SignUpBloc, SignUpState>(
                              bloc: signUpBloc,
                              listener: (context, state) {
                                if (state is ErrorSignUpState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        state.message.toString(),
                                      ),
                                    ),
                                  );
                                }

                                if (state is LoadedSignUpState) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),
                                    ),
                                  );
                                  emailController.clear();
                                  userNameController.clear();
                                  phoneNumberController.clear();
                                  passwordController.clear();
                                  repeatPasswordController.clear();
                                }
                              },
                              builder: (context, state) {
                                if (state is LoadingSignUpState) {
                                  return const Center(
                                    child: LoadingIndicatorWidget(),
                                  );
                                }
                                return AuthButtonWidget(
                                  width: 170,
                                  txtButton: 'ЗАРЕГИСТРИРОВАТЬСЯ',
                                  function: () {
                                    signUpBloc.add(
                                      SignUpAuthEvent(
                                        email: emailController.text,
                                        username: userNameController.text,
                                        phone: phoneNumberController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                                );
                              },
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
      ),
    );
  }
}
