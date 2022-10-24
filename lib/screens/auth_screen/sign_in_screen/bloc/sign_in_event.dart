part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class GetSignInEvent extends SignInEvent {
  final String email;
  final String password;

  GetSignInEvent({
    required this.email,
    required this.password,
  });
}
