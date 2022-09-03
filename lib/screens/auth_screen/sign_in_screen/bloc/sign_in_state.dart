part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class LoadingSignInState extends SignInState {}

class LoadedSignInState extends SignInState {}

class ErrorSignInState extends SignInState {
  final CatchException message;

  ErrorSignInState({required this.message});
}
