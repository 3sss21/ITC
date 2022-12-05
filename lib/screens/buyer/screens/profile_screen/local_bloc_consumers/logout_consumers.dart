import 'package:cashback_app/global_widgets/loading_overlay_widget.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/logout_bloc/bloc/logout_bloc.dart';
import 'package:cashback_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LogoutConsumer extends StatefulWidget {
  final LogoutBloc _logoutBloc;
  const LogoutConsumer({Key? key, required LogoutBloc logoutBloc})
      : _logoutBloc = logoutBloc,
        super(key: key);

  @override
  State<LogoutConsumer> createState() => _LogoutConsumerState();
}

class _LogoutConsumerState extends State<LogoutConsumer> {
  Box tokenBox = Hive.box('tokenBox');

  Future<void> _exitApp() async {
    await Hive.box('tokenBox').delete('token');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      bloc: widget._logoutBloc,
      listener: (context, state) {
        if (state is LoadedLogoutState) {
          if (state.logoutUser.isLogout) {
            _exitApp();
            if (tokenBox.isEmpty) {
              Navigator.pushReplacement(
                context,
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
          return const LoadingOverlayWidget();
        }
        return const SizedBox();
      },
    );
  }
}
