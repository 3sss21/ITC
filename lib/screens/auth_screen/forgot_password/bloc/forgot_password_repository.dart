

import 'package:cashback_app/screens/auth_screen/forgot_password/bloc/forgot_password_provider.dart';

class ForgotPassRepository {
   resetPassword({
    required String email,
  }) {
    ForgotPassProvider provider = ForgotPassProvider();

    return provider.resetPassword(email: email);
  }
}
