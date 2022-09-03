part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPassLoadingState extends ForgotPasswordState {}

class ForgotPassSuccessState extends ForgotPasswordState {}

class ForgotPassErrorState extends ForgotPasswordState {
  final String errorMessage;

 ForgotPassErrorState(this.errorMessage);
}
