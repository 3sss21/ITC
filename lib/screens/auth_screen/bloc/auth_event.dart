part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class GetSignInEvent extends AuthEvent{

final String username;
final String password;

GetSignInEvent({
required this.password,
  required this.username,
});
}

class GetSignUpEvent extends AuthEvent{
  final String username;
final String  password;
final String lastname;
final String patronymic;
final String firstname;

GetSignUpEvent({
required this.lastname,
required this.password,
required this.username,
required this.patronymic,
required this.firstname

});}