import 'package:cashback_app/screens/buyer/screens/profile_screen/changingInfoData_bloc/bloc/changingData_provider.dart';

class ChangingDataRepository {
  patchUser({
    required String username,
    required String email,
    required bool isSeller,
    // required String phone,
  }) {
    ChangingDataProvider provider = ChangingDataProvider();
    provider.patchUser(
      username: username,
      email: email,
      isSeller: isSeller,
      // phone: phone,
    );
    return "";
  }
}
