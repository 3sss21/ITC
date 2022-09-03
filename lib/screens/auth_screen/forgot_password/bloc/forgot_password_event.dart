part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

class GetForgotPasswordEvent extends ForgotPasswordEvent {
  final String email;

  GetForgotPasswordEvent({required this.email});
}
