part of 'confirm_code_bloc.dart';

@immutable
abstract class ConfirmCodeState {}

class ConfirmCodeInitial extends ConfirmCodeState {}



class LoadingConfirmCodedState extends ConfirmCodeState {}

class LoadedConfirmCodeState extends ConfirmCodeState {
  final ConfirmModel confirmModel;

  LoadedConfirmCodeState({required this.confirmModel});
}

class ErrorConfirmCodeState extends ConfirmCodeState {
  final CatchException message;

 ErrorConfirmCodeState({required this.message});
}
