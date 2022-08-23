import 'package:bloc/bloc.dart';
import 'package:cashback_app/screens/auth_screen/bloc/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is GetSignInEvent) {
        emit(AuthLoadingState());
        try {
          await AuthRepository().logIN(
              phoneNumber: event.phoneNumber, userpassword: event.userpassword);

          emit(AuthSuccessState());
        } catch (e) {
          emit(AuthErrorState('erorr'));
        }
      }
      if (event is GetSignUpEvent) {
        try {
          print('qwrety');
          await AuthRepository().createUser(
              phoneNumber: event.phoneNumber,
              email: event.email,
              repeatPassword: event.repeatPassword,
              password: event.password);
        } catch (e) {
          print('eeee === $e');
        }
      }
    });
  }
}
