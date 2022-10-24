import 'package:cashback_app/screens/auth_screen/sign_in_screen/bloc/sign_in_provider.dart';

class SignInRepository {
  loginUser({
    required String email,
    required String password,
  }) {
    SignInProvider provider = SignInProvider();
    provider.loginUser(email: email, password: password);
    return '';
  }
}
