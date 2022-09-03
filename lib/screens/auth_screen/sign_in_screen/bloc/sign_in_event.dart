part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class GetSignInEvent extends SignInEvent {
  final String phone;
  final String password;

  GetSignInEvent({
    required this.phone,
    required this.password,
  });
}
