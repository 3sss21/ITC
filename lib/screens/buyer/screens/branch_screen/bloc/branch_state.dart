part of 'branch_bloc.dart';

@immutable
abstract class BranchState {}

class BranchInitial extends BranchState {}

class LoadingBranchState extends BranchState {}

class LoadedBranchState extends BranchState {
  final List<BranchModel> branchModelList;

  LoadedBranchState({required this.branchModelList});
}

class ErrorBranchState extends BranchState {
  final CatchException? message;

  ErrorBranchState({required this.message});
}
