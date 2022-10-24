import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_textfield_widget.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/local_widgets/authBox_widget.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/user_id_bloc/bloc/user_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global_widgets/btnTryAgain_widget.dart';
import '../../global_widgets/feliz_logo_widget.dart';
import '../../global_widgets/loadingIndicator_widget.dart';
import 'bloc/confirm_code_bloc.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  ConfirmCodeBloc _confirmCodeBloc = ConfirmCodeBloc();
  @override
  void initState() {
    _confirmCodeBloc = ConfirmCodeBloc();
    _confirmCodeBloc.add(GetConfirmCodeEvent(code: confirmController.text));
    super.initState();
  }

  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ConfirmCodeBloc, ConfirmCodeState>(
            bloc: _confirmCodeBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ErrorConfirmCodeState) {
                return Center(
                  child: ButtonTryAgainWidget(
                      onTabFunction: () {
                        _confirmCodeBloc.add(GetConfirmCodeEvent(code: confirmController.text));
                      },
                      btnTheme: Colors.cyan),
                );
              }
              if (state is LoadingConfirmCodedState) {
                return const Center(
                  child: LoadingIndicatorWidget(),
                );
              }

              if (state is LoadedConfirmCodeState) {
                return Column(children: [
                  SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Stack(children: <Widget>[
                      const FelizLogoWidget(),
                      Positioned(
                        top: 231.h,
                        left: 37.w,
                        right: 37.w,
                        child: Container(
                          child: AuthBoxWidget(
                              functionBox:
                                  'Вам отправлен код на почту, подтвердите',
                              listWidgets: [
                                SizedBox(height: 50.h),
                                SizedBox(height: 10.h),
                                AuthTextFieldWidget(
                                  hintext: "Введите код",
                                  controller: confirmController,
                                  isObsecuredText: false,
                                  isSuffixIcon: false,
                                  textInputType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                AuthButtonWidget(
                                  function: () {
                                    if (confirmController ==
                                        state.confirmModel.code) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen(),
                                          ));
                                    }
                                  },
                                  txtButton: "Подтвердить".toUpperCase(),
                                  width: 170.w,
                                ),
                                SizedBox(
                                  height: 32.h,
                                )
                              ]),
                        ),
                      ),
                    ]),
                  ),
                ]);
              }
              return SizedBox();
            }),
      ),
    );
  }
}
