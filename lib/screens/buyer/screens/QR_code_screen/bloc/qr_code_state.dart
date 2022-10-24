part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeState {}

class QrCodeInitial extends QrCodeState {}

class QrCodeLoadedState extends QrCodeState {}

class QrCodeErrorState extends QrCodeState {
  final CatchException? message;

  QrCodeErrorState({this.message});
}
