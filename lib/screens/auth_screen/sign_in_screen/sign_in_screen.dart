import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_blocs/user_data_bloc/profile_bloc.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/loading_overlay_widget.dart';
import 'package:cashback_app/global_widgets/txtBtnBack_widget.dart';
import 'package:cashback_app/screens/auth_screen/forgot_password/forgot_pass_screen.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:cashback_app/screens/seller/seller_navigation/seller_navigation_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passwordKey = GlobalKey();
  late SignInBloc signInBloc;
  late ProfileBloc _profileBloc;
  Box userId = Hive.box('userIdBox');

  @override
  void initState() {
    _openBox();
    signInBloc = SignInBloc();
    _profileBloc = ProfileBloc();

    super.initState();
  }

  Future _openBox() async {
    await Hive.initFlutter();
    await Hive.openBox('tokenBox');
    await Hive.openBox('userIdBox');
  }

  // var maskFormatter = MaskTextInputFormatter(
  //   mask: '+996 (###) ###-###',
  //   filter: {"#": RegExp(r'[0-9]')},
  //   type: MaskAutoCompletionType.lazy,
  // );

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TxtBtnBackWidget(
                          function: () => Navigator.pop(context),
                        ),
                        SizedBox(height: 10.h),
                        AuthBoxWidget(
                          functionBox: 'Введите свои данные',
                          listWidgets: [
                            SizedBox(height: 50.h),
                            AuthTextFieldWidget(
                              onPressed: () {
                                setState(() {
                                  emailKey.currentState?.reset();
                                });
                              },
                              controller: emailController,
                              textInputType: TextInputType.emailAddress,
                              hintext: "felizCoffee@gmail.com",
                              isObsecuredText: false,
                              isSuffixIcon: false,
                              isClosedEye: false,
                              autofillHints: const [AutofillHints.email],
                              formFieldKey: emailKey,
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
                                } else if (value.length > 16) {
                                  return 'Пароль может быть от 6 до 16 символов';
                                } else {
                                  return null;
                                }
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
                                    _profileBloc.add(
                                      GetProfileEvent(
                                        userId: userId.get('userId'),
                                      ),
                                    );
                                    emailController.clear();
                                    passwordController.clear();
                                  }
                                },
                                builder: (context, state) {
                                  if (state is LoadingSignInState) {
                                    return Center(
                                      child: LoadingIndicatorWidget(
                                        width: 30.w,
                                        height: 30.h,
                                        color: ThemeHelper.white,
                                      ),
                                    );
                                  }
                                  return AuthButtonWidget(
                                    width: 98,
                                    height: 25,
                                    txtButton: 'ВОЙТИ',
                                    themeButton: ThemeHelper.white,
                                    textColor: ThemeHelper.green100,
                                    function: () {
                                      FocusScope.of(context).unfocus();
                                      emailKey.currentState?.validate();
                                      passwordKey.currentState?.validate();
                                      if (emailKey.currentState!.validate() &&
                                          passwordKey.currentState!
                                              .validate()) {
                                        signInBloc.add(
                                          GetSignInEvent(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                      } else {
                                        return null;
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<ProfileBloc, ProfileState>(
                    bloc: _profileBloc,
                    listener: (context, state) {
                      if (state is ErrorProfileState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.message.toString(),
                            ),
                          ),
                        );
                      }
                      if (state is LoadedProfileState) {
                        state.userDataModel.isSeller!
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SellerNavigationWidget(
                                    currentIndex: 0,
                                  ),
                                ),
                              )
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BuyerNavigationWidget(
                                          currentIndex: 0),
                                ),
                              );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingProfileState) {
                        return const LoadingOverlayWidget();
                      }
                      return const SizedBox();
                    },
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
