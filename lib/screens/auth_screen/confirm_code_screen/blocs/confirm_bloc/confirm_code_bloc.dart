import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/confirm_response_model.dart';
import 'package:cashback_app/screens/auth_screen/confirm_code_screen/blocs/confirm_bloc/confirm_code_repository.dart';
import 'package:meta/meta.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  ConfirmCodeBloc() : super(ConfirmCodeInitial()) {
    on<ConfirmCodeEvent>(
      (event, emit) async {
        if (event is PostConfirmCodeEvent) {
          emit(LoadingConfirmCodeState());
          try {
            ConfirmResponseModel responseModel =
                await ConfirmRepository().confirmCode(
              code: event.code,
              email: event.email,
            );
            emit(
              LoadedConfirmCodeState(responseModel: responseModel),
            );
          } catch (e) {
            emit(
              ErrorConfirmCodeState(
                message: CatchException.convertException(e),
              ),
            );
          }
        }
      },
    );
  }
}
