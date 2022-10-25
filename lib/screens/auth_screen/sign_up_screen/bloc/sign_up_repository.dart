import 'package:cashback_app/models/sign_up_response_model.dart';
import 'package:cashback_app/screens/auth_screen/sign_up_screen/bloc/sign_up_provider.dart';

class SignUpRepository {
  Future<SignUpResponseModel> createUser({
    required String email,
    required String username,
    required String phoneNumber,
    required String password,
  }) {
    SignUpProvider provider = SignUpProvider();
    return provider.createUser(
      email: email,
      username: username,
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}
