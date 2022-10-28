part of 'confirm_code_bloc.dart';

@immutable
abstract class ConfirmCodeState {}

class ConfirmCodeInitial extends ConfirmCodeState {}

class LoadingConfirmCodedState extends ConfirmCodeState {}

class LoadedConfirmCodeState extends ConfirmCodeState {
  ConfirmResponseModel responseModel;
  LoadedConfirmCodeState({required this.responseModel});
}

class ErrorConfirmCodeState extends ConfirmCodeState {
  final CatchException message;

  ErrorConfirmCodeState({required this.message});
}
