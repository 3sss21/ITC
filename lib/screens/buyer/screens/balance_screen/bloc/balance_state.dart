part of 'balance_bloc.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

class LoadingBalanceState extends BalanceState {}

class LoadedBalanceState extends BalanceState {
  final List<BalanceModel> balanceModel;

  LoadedBalanceState({required this.balanceModel});
}

class ErrorBalanceState extends BalanceState {
  final CatchException? message;

  ErrorBalanceState({required this.message});
}
