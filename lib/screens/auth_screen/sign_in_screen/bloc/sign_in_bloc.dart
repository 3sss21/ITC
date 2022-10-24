import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/bloc/sign_in_repository.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is GetSignInEvent) {
        emit(LoadingSignInState());
        try {
          await SignInRepository().loginUser(
            email: event.email,
            password: event.password,
          );
          emit(LoadedSignInState());
        } catch (e) {
          emit(
            ErrorSignInState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
