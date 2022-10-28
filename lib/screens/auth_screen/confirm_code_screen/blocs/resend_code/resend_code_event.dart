part of 'resend_code_bloc.dart';

@immutable
abstract class ResendCodeEvent {}

class PostResendCodeEvent extends ResendCodeEvent {
  final String email;

  PostResendCodeEvent({required this.email});
}
