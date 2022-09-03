import 'package:bloc/bloc.dart';
import 'package:cashback_app/screens/auth_screen/forgot_password/bloc/forgot_password_repository.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      if (event is GetForgotPasswordEvent) {
        emit(ForgotPassLoadingState());
        try {
          await ForgotPassRepository().resetPassword(email: event.email);

          emit(ForgotPassSuccessState());
        } catch (e) {
          emit(ForgotPassErrorState('erorr'));
        }
      }
    });
  }
}
