part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState(this.errorMessage);
}

class CreateUserState extends AuthState{
  
}