part of 'branch_bloc.dart';

@immutable
abstract class BranchEvent {}

class GetBranchEvent extends BranchEvent {
  final String? branchName;

  GetBranchEvent({this.branchName});
}
