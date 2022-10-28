part of 'resend_code_bloc.dart';

@immutable
abstract class ResendCodeState {}

class ResendCodeInitial extends ResendCodeState {}

class LoadingResendCodeState extends ResendCodeState {}

class LoadedResendCodeState extends ResendCodeState {
  final ResendResponseModel responseModel;

  LoadedResendCodeState({required this.responseModel});
}

class ErorResendCodeState extends ResendCodeState {
  final CatchException message;

  ErorResendCodeState({required this.message});
}
