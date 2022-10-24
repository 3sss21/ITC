import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
import 'package:email_validator/email_validator.dart';
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
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> usernameKey = GlobalKey();
  final GlobalKey<FormFieldState> numberKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();
  final GlobalKey<FormFieldState> repeatPasswordKey = GlobalKey();
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
                            onPressed: () {
                              setState(() {
                                emailKey.currentState?.reset();
                              });
                            },
                            // contentPadding: EdgeInsets.only(top: 5.r),
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            hintext: "felizCoffee@gmail.com",
                            isObsecuredText: false,
                            isSuffixIcon: false,
                            isClosedEye: false,
                            autofillHints: const [AutofillHints.email],
                            formFieldKey: emailKey,
                            validate: (value) {
                              // if (value != null ||
                              //     !EmailValidator.validate(value!)) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !EmailValidator.validate(value)) {
                                return 'Введите правильный адрес эл. почты';
                              } 
                              else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          AuthTextFieldWidget(
                            onPressed: () {
                              setState(() {
                                usernameKey.currentState?.reset();
                              });
                            },
                            controller: userNameController,
                            formFieldKey: usernameKey,
                            textInputType: TextInputType.text,
                            hintext: "имя",
                            isObsecuredText: false,
                            isSuffixIcon: false,
                            isClosedEye: false,
                            validate: (value) {
                              // if (value != null ||
                              //     !EmailValidator.validate(value!)) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                                return 'Введите имя, пожалуйста';
                              } else {
                                return null;
                              }
                            },
                          ),
                           SizedBox(height: 10.h),
                          AuthTextFieldWidget(
                              onPressed: () {
                                setState(() {
                                  numberKey.currentState?.reset();
                                });
                              },
                              formFieldKey: numberKey,
                              controller: phoneNumberController,
                              textInputType: TextInputType.number,
                              hintext: "+996 (777) 464-xxx",
                              isObsecuredText: false,
                              isSuffixIcon: false,
                              isClosedEye: false,
                              autofillHints: const [
                                AutofillHints.telephoneNumber
                              ],
                              inputFormatters: [maskFormatter],
                              // validate: (value) {
                              //   if (value!.length < 18 && value.length > 1) {
                              //     return 'Введите правильный номер';
                              //   } else if (value.isEmpty || value == null) {
                              //     return 'Это поле не может быть пустым';
                              //   } else {
                              //     return null;
                              //   }
                              // }
                              // validatorFunc: () => null,
                              ),
                          SizedBox(height: 10.h),
                          AuthTextFieldWidget(
                            onPressed: () {
                              setState(() {
                                passwordKey.currentState?.reset();
                              });
                            },
                            formFieldKey: passwordKey,
                            contentPadding: EdgeInsets.only(bottom: 12.h),
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            hintext: "пароль",
                            isObsecuredText: true,
                            isSuffixIcon: true,
                            isClosedEye: true,
                            validate: (value) {
                              if (value!.length < 6 && value.length > 1) {
                                return 'Пароль слишком короткий';
                              } else if (value.isEmpty || value == null) {
                                return 'Это поле не может быть пустым';
                              }else if (value.length > 16) {
                                return 'Пароль может быть от 6 до 16 символов';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          AuthTextFieldWidget(
                            onPressed: () {
                              setState(() {
                                repeatPasswordKey.currentState?.reset();
                              });
                            },
                            formFieldKey: repeatPasswordKey,
                            contentPadding: EdgeInsets.only(bottom: 12.r),
                            controller: repeatPasswordController,
                            textInputType: TextInputType.text,
                            hintext: "повторите пароль",
                            isObsecuredText: true,
                            isSuffixIcon: true,
                            isClosedEye: true,
                            validate: (value) {
                              if (passwordController !=
                                      repeatPasswordController) {
                                return 'Пароли не совпадают';
                              } else if (value!.isEmpty || value == null) {
                                return 'Это поле не может быть пустым';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 23.h, bottom: 32.h),
                            child: BlocConsumer<SignUpBloc, SignUpState>(
                              bloc: signUpBloc,
                              listener: (context, state) {
                                print('object');
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
                                  width: 170.w,
                                  txtButton: 'продолжить'.toUpperCase(),
                                  function: () {
                                    FocusScope.of(context).unfocus();
                                    emailKey.currentState?.validate();
                                    usernameKey.currentState?.validate();
                                    passwordKey.currentState?.validate();
                                    repeatPasswordKey.currentState?.validate();
                                    print(
                                        'email=== ${emailKey.currentState?.validate()}');
                                    print(
                                        'username=== ${usernameKey.currentState?.validate()}');
                                    print(
                                        'number=== ${numberKey.currentState?.validate()}');
                                    print(
                                        'password=== ${passwordKey.currentState?.validate()}');
                                    print(
                                        'repassword=== ${repeatPasswordKey.currentState?.validate()}');

                                    // if (emailKey.currentState!.validate() ==
                                    //         true &&
                                    //     usernameKey.currentState!.validate() ==
                                    //         true &&
                                    //     passwordKey.currentState!.validate() ==
                                    //         true &&
                                    //     repeatPasswordKey.currentState!
                                    //             .validate() ==
                                    //         true) {
                                    //   signUpBloc.add(
                                    //     SignUpAuthEvent(
                                    //       email: emailController.text,
                                    //       username: userNameController.text,
                                    //       phone: phoneNumberController.text,
                                    //       password: passwordController.text,
                                    //     ),
                                    //   );
                                    //   ScaffoldMessenger.of(context)
                                    // ..removeCurrentSnackBar()
                                    // ..showSnackBar(
                                    //   const SnackBar(
                                    //     content: Text(
                                    //         'Вы успешно зарегистрированы!'),
                                    //   ),
                                    // );
                                    // } else {
                                    //   return null;
                                    // }
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
