import 'package:cashback_app/global_blocs/user_data_bloc/profile_provider.dart';
import 'package:cashback_app/models/user_data_model.dart';

class ProfileRepository {
  Future<UserDataModel> getProfile({required int userId}) {
    ProfileProvider profileProvider = ProfileProvider();

    return profileProvider.getProfile(userId: userId);
  }
}
