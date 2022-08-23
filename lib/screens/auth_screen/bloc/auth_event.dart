part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class GetSignInEvent extends AuthEvent{

final String phoneNumber;
final String userpassword;

GetSignInEvent({
required this.userpassword,
  required this.phoneNumber,
});
}

class GetSignUpEvent extends AuthEvent{
  final String email;
final String  phoneNumber;
final String password;
final String repeatPassword;


GetSignUpEvent({
required this.email,
required this.phoneNumber,
required this.password,
required this.repeatPassword,

});}