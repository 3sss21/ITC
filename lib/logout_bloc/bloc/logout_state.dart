part of 'logout_bloc.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LoadingLogoutState extends LogoutState {}

class LoadedLogoutState extends LogoutState {}

class ErrorLogoutState extends LogoutState {
  final CatchException message;

  ErrorLogoutState({required this.message});
}
