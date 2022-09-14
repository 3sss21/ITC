part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class LoadedProfileState extends ProfileState {
  final ProfileModel profileModelList;

  LoadedProfileState({required this.profileModelList});
}

class ErorProfileState extends ProfileState {
  final CatchException message;

  ErorProfileState({required this.message});
}
