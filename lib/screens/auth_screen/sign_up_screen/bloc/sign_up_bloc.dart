import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/sign_up_response_model.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/bloc/sign_up_repository.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpAuthEvent) {
        emit(LoadingSignUpState());
        try {
          SignUpResponseModel responseModel =
              await SignUpRepository().createUser(
            email: event.email,
            username: event.username,
            phoneNumber: event.phone,
            password: event.password,
          );
          responseModel.response == 'Успешно зарегистрирован новый пользователь'
              ? emit(
                  LoadedSignUpState(responseModel: responseModel),
                )
              : null;
        } catch (e) {
          emit(
            ErrorSignUpState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
