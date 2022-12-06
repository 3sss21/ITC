part of 'user_id_bloc.dart';

@immutable
abstract class UserIdState {}

class UserIdInitial extends UserIdState {}

class LoadingUserIdState extends UserIdState {}

class LoadedUserIdState extends UserIdState {
  final UserIdModel userIdModel;

  LoadedUserIdState({required this.userIdModel});
}

class ErrorUserIdState extends UserIdState {
  final CatchException message;

  ErrorUserIdState({required this.message});
}
