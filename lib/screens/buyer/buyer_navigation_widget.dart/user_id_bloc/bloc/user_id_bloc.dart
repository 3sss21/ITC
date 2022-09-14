import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/user_id_model.dart';
import 'package:cashback_app/screens/buyer/buyer_navigation_widget.dart/user_id_bloc/bloc/user_id_repository.dart';
import 'package:meta/meta.dart';

part 'user_id_event.dart';
part 'user_id_state.dart';

class UserIdBloc extends Bloc<UserIdEvent, UserIdState> {
  UserIdBloc() : super(UserIdInitial()) {
    on<UserIdEvent>((event, emit) async {
      log("bloc1");
      if (event is GetUserIdEvent) {
        emit(LoadingUserIdState());
        log("bloc2");

        try {
          UserIdModel userIdModelList = await UserIdRepository().getUserId();
          log("bloc3");

          emit(LoadedUserIdState(userIdModelList: userIdModelList));
          log("bloc4");
        } catch (e) {
          print('UserId bloc error=====$e');
          emit(
            ErrorUserIdState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
