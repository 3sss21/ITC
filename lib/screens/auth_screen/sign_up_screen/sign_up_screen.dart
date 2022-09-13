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
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
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

  var maskFormatter = MaskTextInputFormatter(
    mask: '+996 (###) ###-###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Form(
                key: formKey,
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
                              contentPadding: EdgeInsets.only(top: 5.r),
                              controller: emailController,
                              textInputType: TextInputType.emailAddress,
                              hintext: "felizCoffee@gmail.com",
                              isObsecuredText: false,
                              isSuffixIcon: false,
                              isClosedEye: false,
                              validatorFunc: () {
                                ((value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                          .hasMatch(value)) {
                                    return 'Введите правильный эл. адрес';
                                  } else {
                                    return null;
                                  }
                                });
                              },
                            ),
                            SizedBox(height: 10.h),
                            AuthTextFieldWidget(
                              contentPadding: EdgeInsets.only(top: 5.r),
                              controller: userNameController,
                              textInputType: TextInputType.text,
                              hintext: "Имя",
                              isObsecuredText: false,
                              isSuffixIcon: false,
                              isClosedEye: false,
                              validatorFunc: () {
                                ((value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                                    return 'Введите правильное имя';
                                  } else {
                                    return null;
                                  }
                                });
                              },
                            ),
                            SizedBox(height: 10.h),
                            AuthTextFieldWidget(
                              contentPadding: EdgeInsets.only(),
                              controller: phoneNumberController,
                              textInputType: TextInputType.number,
                              hintext: "+996 (000) 000-000",
                              isObsecuredText: false,
                              isSuffixIcon: false,
                              isClosedEye: false,
                              inputFormatters: [maskFormatter],
                              maxLength: 12,
                              validatorFunc: () {
                                ((value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                          .hasMatch(value)) {
                                    return 'Введите правильный номер телефона';
                                  } else {
                                    return null;
                                  }
                                });
                              },
                            ),
                            SizedBox(height: 10.h),
                            AuthTextFieldWidget(
                                contentPadding: EdgeInsets.only(left: 33.r),
                                controller: passwordController,
                                textInputType: TextInputType.text,
                                hintext: "Пароль",
                                isObsecuredText: true,
                                isSuffixIcon: true,
                                isClosedEye: true,
                                maxLength: 16,
                                validatorFunc: () {
                                  ((value) {
                                    value.length < 6
                                        ? 'Пароль слишком короткий'
                                        : null;
                                  });
                                }),
                            SizedBox(height: 10.h),
                            AuthTextFieldWidget(
                              contentPadding:
                                  EdgeInsets.only(left: 33.r, bottom: 5),
                              controller: repeatPasswordController,
                              textInputType: TextInputType.text,
                              hintext: "Повторите пароль",
                              isObsecuredText: true,
                              isSuffixIcon: true,
                              isClosedEye: true,
                              validatorFunc: () {
                                ((value) {
                                  if (passwordController !=
                                      repeatPasswordController) {
                                    return 'Пароли не совпадают';
                                  } else {
                                    return null;
                                  }
                                });
                              },
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
                                  if (formKey.currentState!.validate()) {
                                    final snackBar = SnackBar(
                                        content: Text('Submitting form'));
                                    _scaffoldKey.currentState!
                                        .showSnackBar(snackBar);
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
            ),
          ],
        ),
      ),
    );
  }
}
