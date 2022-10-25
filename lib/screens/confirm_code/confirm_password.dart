import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/user_id_bloc/bloc/user_id_bloc.dart';
import 'package:cashback_app/screens/confirm_code/local_widgets/pinput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../global_widgets/btnTryAgain_widget.dart';
import '../../global_widgets/feliz_logo_widget.dart';
import '../../global_widgets/loadingIndicator_widget.dart';
import 'bloc/confirm_code_bloc.dart';

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
  ConfirmCodeBloc _confirmCodeBloc = ConfirmCodeBloc();
  @override
  void initState() {
    _confirmCodeBloc = ConfirmCodeBloc();
    super.initState();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

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
                    top: 231.h,
                    left: 37.w,
                    right: 37.w,
                    child: Column(
                      children: [
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
                        SizedBox(height: 30.h),
                        BlocConsumer<ConfirmCodeBloc, ConfirmCodeState>(
                          bloc: _confirmCodeBloc,
                          listener: (context, state) {
                            if (state is LoadedConfirmCodeState) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is ErrorConfirmCodeState) {
                              return Center(
                                child: ButtonTryAgainWidget(
                                  onTabFunction: () {
                                    _confirmCodeBloc.add(
                                      PostConfirmCodeEvent(
                                        code: confirmController.text,
                                        email: widget.email,
                                      ),
                                    );
                                  },
                                  btnTheme: Colors.cyan,
                                ),
                              );
                            }

                            return SizedBox(
                              width: 300.w,
                              height: 25.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  _confirmCodeBloc.add(
                                    PostConfirmCodeEvent(
                                      code: confirmController.text,
                                      email: widget.email,
                                    ),
                                  );
                                },
                                child: Text(
                                  'Подтвердить',
                                  style: TextStyleHelper.authButtonText
                                      .copyWith(color: ThemeHelper.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      ThemeHelper.green80),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Отправить еще раз',
                            style: TextStyleHelper.authButtonText.copyWith(
                              decoration: TextDecoration.underline,
                            ),
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
