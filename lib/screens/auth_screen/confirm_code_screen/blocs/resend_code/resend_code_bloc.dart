import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/resend_response_model.dart';
import 'package:cashback_app/screens/auth_screen/confirm_code_screen/blocs/resend_code/resend_repository.dart';
import 'package:meta/meta.dart';

part 'resend_code_event.dart';
part 'resend_code_state.dart';

class ResendCodeBloc extends Bloc<ResendCodeEvent, ResendCodeState> {
  ResendCodeBloc() : super(ResendCodeInitial()) {
    on<PostResendCodeEvent>(
      (event, emit) async {
        emit(LoadingResendCodeState());
        try {
          log('Event.email ================ ${event.email}');
          ResendResponseModel responseModel =
              await ResendCodeRepository().resendCode(email: event.email);

          emit(
            LoadedResendCodeState(responseModel: responseModel),
          );
        } catch (e) {
          emit(
            ErorResendCodeState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
