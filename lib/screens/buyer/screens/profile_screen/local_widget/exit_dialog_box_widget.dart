import 'package:cashback_app/commons/text_style_helper.dart';
import 'package:cashback_app/commons/theme_helper.dart';
import 'package:cashback_app/global_widgets/loadingIndicator_widget.dart';
import 'package:cashback_app/screens/auth_screen/local_widgets/auth_button_widget.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/logout_bloc/bloc/logout_bloc.dart';
import 'package:cashback_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExitDialogBoxWidget extends StatelessWidget {
  final Function() onPressed;
  final LogoutBloc _logoutBloc;
  ExitDialogBoxWidget({
    Key? key,
    required this.onPressed,
    required LogoutBloc logoutBloc,
  })  : _logoutBloc = logoutBloc,
        super(key: key);

  Box tokenBox = Hive.box('tokenBox');
  Box userIdBox = Hive.box('userIdBox');

  Future<void> _exitApp() async {
    await Hive.box('tokenBox').delete('token');
    await Hive.box('userIdBox').delete('userId');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      iconPadding: EdgeInsets.only(right: 5.w, top: 5.h),
      icon: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          iconSize: 30,
          icon: Icon(
            Icons.highlight_off_outlined,
            color: ThemeHelper.green80,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(top: 10.h, left: 30.w, right: 30.w),
      content: const Text(
        'Вы уверены что хотите выйти?',
        textAlign: TextAlign.center,
      ),
      contentTextStyle:
          TextStyleHelper.f20w700.copyWith(color: ThemeHelper.green80),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
          child: BlocConsumer<LogoutBloc, LogoutState>(
            bloc: _logoutBloc,
            listener: (context, state) {
              if (state is LoadedLogoutState) {
                if (state.logoutUser.isLogout) {
                  _exitApp();
                  if (tokenBox.isEmpty && userIdBox.isEmpty) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ),
                    );
                  }
                }
              }
            },
            builder: (context, state) {
              if (state is LoadingLogoutState) {
                return LoadingIndicatorWidget(
                  width: 30.w,
                  height: 30.h,
                  color: ThemeHelper.green80,
                );
              }
              return AuthButtonWidget(
                txtButton: 'Выйти',
                function: () => onPressed(),
                width: 200.w,
                height: 30.h,
                themeButton: ThemeHelper.green80,
                textColor: ThemeHelper.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
