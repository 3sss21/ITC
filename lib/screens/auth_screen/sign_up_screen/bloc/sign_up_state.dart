part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class LoadedSignUpState extends SignUpState {
  final SignUpResponseModel responseModel;

  LoadedSignUpState({required this.responseModel});
}

class ErrorSignUpState extends SignUpState {
  final CatchException message;

  ErrorSignUpState({required this.message});
}

class ValidSignUpState extends SignUpState {}

class InValidSignUpState extends SignUpState {}
