part of 'user_id_bloc.dart';

@immutable
abstract class UserIdState {}

class UserIdInitial extends UserIdState {}

class LoadingUserIdState extends UserIdState {}

class LoadedUserIdState extends UserIdState {
  final UserIdModel userIdModelList;

  LoadedUserIdState({required this.userIdModelList});
}

class ErrorUserIdState extends UserIdState {
  final CatchException message;

  ErrorUserIdState({required this.message});
}
