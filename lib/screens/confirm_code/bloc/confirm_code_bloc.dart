import 'package:bloc/bloc.dart';
import 'package:cashback_app/models/confirm_model.dart';
import 'package:cashback_app/screens/confirm_code/bloc/confirm_code_repository.dart';
import 'package:meta/meta.dart';

import '../../../helper/catchException.dart';

part 'confirm_code_event.dart';
part 'confirm_code_state.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  List userIdModelList = [];
  ConfirmCodeBloc() : super(ConfirmCodeInitial()) {
    on<ConfirmCodeEvent>((event, emit) async {
      if (event is PostConfirmCodeEvent) {
        emit(LoadingConfirmCodedState());
        try {
          await ConfirmRepository().confirmCode(
            code: event.code,
            email: event.email,
          );
          emit(LoadedConfirmCodeState());
        } catch (e) {
          emit(
            ErrorConfirmCodeState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
