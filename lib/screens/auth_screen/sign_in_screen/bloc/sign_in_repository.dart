import 'package:cashback_app/models/sign_in_response_model.dart';
import 'package:cashback_app/screens/auth_screen/sign_in_screen/bloc/sign_in_provider.dart';

class SignInRepository {
  Future<SignInResponseModel> loginUser({
    required String email,
    required String password,
  }) {
    SignInProvider provider = SignInProvider();
    return provider.loginUser(email: email, password: password);
  }
}
