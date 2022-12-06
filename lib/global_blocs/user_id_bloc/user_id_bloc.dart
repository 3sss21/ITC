import 'package:bloc/bloc.dart';
import 'package:cashback_app/global_blocs/user_id_bloc/user_id_repository.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/user_id_model.dart';
import 'package:meta/meta.dart';

part 'user_id_event.dart';
part 'user_id_state.dart';

class UserIdBloc extends Bloc<UserIdEvent, UserIdState> {
  UserIdBloc() : super(UserIdInitial()) {
    on<GetUserIdEvent>((event, emit) async {
      emit(LoadingUserIdState());
      try {
        UserIdModel userIdModel = await UserIdRepository().getUserId();

        emit(
          LoadedUserIdState(userIdModel: userIdModel),
        );
      } catch (e) {
        emit(
          ErrorUserIdState(
            message: CatchException.convertException(e),
          ),
        );
      }
    });
  }
}
