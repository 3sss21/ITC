import 'package:bloc/bloc.dart';
import 'package:cashback_app/global_blocs/user_data_bloc/profile_repository.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/user_data_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileEvent) {
        emit(LoadingProfileState());
        try {
          UserDataModel userDataModel =
              await ProfileRepository().getProfile(userId: event.userId);

          emit(
            LoadedProfileState(userDataModel: userDataModel),
          );
        } catch (e) {
          emit(
            ErrorProfileState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
