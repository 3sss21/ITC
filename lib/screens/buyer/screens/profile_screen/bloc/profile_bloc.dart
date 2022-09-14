import 'package:bloc/bloc.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/profile_model.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/bloc/profile_repository.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileEvent) {
        emit(LoadingProfileState());
        try {
          ProfileModel profileModelList =
              await ProfileRepository().getProfile();

          emit(LoadedProfileState(profileModelList: profileModelList));
        } catch (e) {
          print('Profile bloc error=====$e');
          emit(
            ErorProfileState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
