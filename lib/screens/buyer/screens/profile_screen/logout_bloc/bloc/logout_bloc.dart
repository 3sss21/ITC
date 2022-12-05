import 'package:bloc/bloc.dart';
import 'package:cashback_app/commons/logout_user.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/logout_bloc/bloc/logout_repository.dart';
import 'package:meta/meta.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<PostLogoutEvent>(
      (event, emit) async {
        emit(LoadingLogoutState());
        try {
          LogoutUser logoutUser = await LogoutRepository().logoutUser();
          emit(LoadedLogoutState(logoutUser: logoutUser));
        } catch (e) {
          emit(
            ErrorLogoutState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
