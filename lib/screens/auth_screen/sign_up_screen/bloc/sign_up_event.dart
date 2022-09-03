part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpAuthEvent extends SignUpEvent {
  final String email;
  final String username;
  final String phone;
  final String password;
  // final String repeatPassword;

  SignUpAuthEvent({
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
    // required this.repeatPassword,
  });
}
