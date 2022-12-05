part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class LoadedProfileState extends ProfileState {
  final UserDataModel userDataModel;

  LoadedProfileState({required this.userDataModel});
}

class ErrorProfileState extends ProfileState {
  final CatchException message;

  ErrorProfileState({required this.message});
}
