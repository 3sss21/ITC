import 'package:cashback_app/models/profile_model.dart';
import 'package:cashback_app/screens/buyer/screens/profile_screen/bloc/profile_provider.dart';

class ProfileRepository {
  Future<ProfileModel> getProfile() {
    ProfileProvider profileProvider = ProfileProvider();

    return profileProvider.getProfile();
  }
}
