part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class LoadedSignUpState extends SignUpState {}

class ErrorSignUpState extends SignUpState {
  final CatchException message;

  ErrorSignUpState({required this.message});
}
