import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/screens/auth_screen/forgot_password/forgot_pass_screen.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SignInBloc signInBloc;

  Future _openBox() async {
    await Hive.initFlutter();
    await Hive.openBox('tokenBox');
    await Hive.openBox('phoneBox');
  }

  @override
  void initState() {
    signInBloc = SignInBloc();
    _openBox();
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
                    top: 231.h,
                    left: 37.w,
                    right: 37.w,
                    child: AuthBoxWidget(
                      functionBox: 'Введите свои данные',
                      listWidgets: [
                        SizedBox(height: 50.h),
                        AuthTextFieldWidget(
                          contentPadding: EdgeInsets.only(top: 5.r),
                          inputFormatters: [maskFormatter],
                          isObsecuredText: false,
                          isSuffixIcon: false,
                          isClosedEye: false,
                          hintext: "+996 (000) 000-000",
                          textInputType: TextInputType.number,
                          controller: phoneController,
                          validatorFunc: () {
                            ((value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                                return 'Введите правильный номер телефона';
                              } else {
                                return null;
                              }
                            });
                          },
                        ),
                        SizedBox(height: 10.h),
                        AuthTextFieldWidget(
                          contentPadding: EdgeInsets.only(left: 25.r),
                          isObsecuredText: true,
                          isSuffixIcon: true,
                          isClosedEye: true,
                          hintext: "Пароль",
                          textInputType: TextInputType.text,
                          controller: passwordController,
                          validatorFunc: () {
                            ((value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                                return 'йцукен';
                              } else {
                                return null;
                              }
                            });
                          },
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.r),
                            child: Text(
                              'Забыли пароль?',
                              style: TextStyleHelper.forgotPass,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.h, bottom: 31.h),
                          child: BlocConsumer<SignInBloc, SignInState>(
                            bloc: signInBloc,
                            listener: (context, state) {
                              if (state is ErrorSignInState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      state.message.toString(),
                                    ),
                                  ),
                                );
                              }

                              if (state is LoadedSignInState) {
                                var box = Hive.box('phoneBox');
                                box.put('phone', phoneController.text);
                                print(box.get('phone'));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BuyerNavigationWidget(
                                            currentIndex: 0),
                                  ),
                                );
                                phoneController.clear();
                                passwordController.clear();
                              }
                            },
                            builder: (context, state) {
                              if (state is LoadingSignInState) {
                                const Center(
                                  child: LoadingIndicatorWidget(),
                                );
                              }
                              return AuthButtonWidget(
                                width: 98,
                                txtButton: 'ВОЙТИ',
                                function: () => signInBloc.add(
                                  GetSignInEvent(
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
