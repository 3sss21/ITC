part of 'changing_data_bloc.dart';

@immutable
abstract class ChangingDataState {}

class ChangingDataInitial extends ChangingDataState {}

class LoadingChangingDataState extends ChangingDataState {}

class LoadedChangingDataState extends ChangingDataState {}

class ErrorChangingDataState extends ChangingDataState {
  final CatchException message;

  ErrorChangingDataState({required this.message});
}
