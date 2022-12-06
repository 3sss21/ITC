import 'dart:developer';

import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/feliz_logo_widget.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/global_widgets/show_dialog_widget.dart';
import 'package:cashback_app/global_widgets/txtBtnBack_widget.dart';
import 'package:cashback_app/screens/auth_screen/confirm_code_screen/blocs/confirm_bloc/confirm_code_bloc.dart';
import 'package:cashback_app/screens/auth_screen/confirm_code_screen/blocs/resend_code/resend_code_bloc.dart';
import 'package:cashback_app/screens/auth_screen/confirm_code_screen/local_widgets/pinput_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/buyer_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmScreen extends StatefulWidget {
  final String email;
  final String pinCode;
  const ConfirmScreen({
    Key? key,
    required this.email,
    required this.pinCode,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late ConfirmCodeBloc _confirmCodeBloc;
  late ResendCodeBloc _resendCodeBloc;
  @override
  void initState() {
    _confirmCodeBloc = ConfirmCodeBloc();
    _resendCodeBloc = ResendCodeBloc();
    super.initState();
  }

  TextEditingController confirmController = TextEditingController();
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
                    top: 150.h,
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
                          functionBox: 'Вам отправлен код на почту:',
                          listWidgets: [
                            Text(
                              widget.email,
                              style: TextStyleHelper.f16fw700.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              'потвердите...',
                              textAlign: TextAlign.center,
                              style: TextStyleHelper.functionBox,
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                        SizedBox(height: 70.h),
                        PinputWidget(
                          controller: confirmController,
                        ),
                        SizedBox(height: 50.h),
                        BlocConsumer<ConfirmCodeBloc, ConfirmCodeState>(
                          bloc: _confirmCodeBloc,
                          listener: (context, state) {
                            if (state is ErrorConfirmCodeState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.message.toString(),
                                  ),
                                ),
                              );
                            }

                            if (state is LoadedConfirmCodeState) {
                              Navigator.push(
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
                            if (state is LoadingConfirmCodeState) {
                              return LoadingIndicatorWidget(
                                width: 30.w,
                                height: 30.h,
                                color: ThemeHelper.green80,
                              );
                            }
                            return SizedBox(
                              width: 300.w,
                              height: 30.h,
                              child: AuthButtonWidget(
                                function: () => _confirmCodeBloc.add(
                                  PostConfirmCodeEvent(
                                    code: confirmController.text,
                                    email: widget.email,
                                  ),
                                ),
                                txtButton: 'Подтвердить',
                                textColor: ThemeHelper.white,
                                width: 230.w,
                                height: 25.h,
                                themeButton: ThemeHelper.green80,
                              ),
                            );
                          },
                        ),
                        BlocConsumer<ResendCodeBloc, ResendCodeState>(
                          bloc: _resendCodeBloc,
                          listener: (context, state) {
                            if (state is ErorResendCodeState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.message.toString(),
                                  ),
                                ),
                              );
                            }

                            if (state is LoadedResendCodeState) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ShowDialogWidget(
                                    onPressed: () => Navigator.pop(context),
                                    contentText: state.responseModel.message!,
                                    buttonText: 'Хорошо',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                      vertical: 20.h,
                                    ),
                                    buttonPadding:
                                        EdgeInsets.only(bottom: 20.h),
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is LoadingResendCodeState) {
                              return LoadingIndicatorWidget(
                                width: 30.w,
                                height: 30.h,
                                color: ThemeHelper.green80,
                              );
                            }
                            return Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  log(widget.email.toString());
                                  _resendCodeBloc.add(
                                    PostResendCodeEvent(email: widget.email),
                                  );
                                },
                                child: Text(
                                  'Отправить еще раз',
                                  style:
                                      TextStyleHelper.authButtonText.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            );
                          },
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
