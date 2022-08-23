
import 'package:cashback_app/screens/auth_screen/bloc/auth_provider.dart';

class AuthRepository {
  createUser({
    required String email,
    required String phoneNumber,
    required String password,
    required String repeatPassword,
  
  }) {
    SignUpProvider provider = SignUpProvider();
    provider.createUser(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      repeatPassword: repeatPassword,
    );
    return "";
  }
  logIN({
    required String phoneNumber,
    required String userpassword,
  }) {
    SignUpProvider provider = SignUpProvider();

    return provider.LogIn(phoneNumber: phoneNumber, userpassword: userpassword);
  }
   
  }