part of 'cash_box_bloc.dart';

@immutable
abstract class CashBoxState {}

class CashBoxInitial extends CashBoxState {}


class CashBoxLoadingState extends CashBoxState {}

class CashBoxSuccessState extends CashBoxState {}

class CashBoxErrorState extends CashBoxState {
  final String errorMessage;

  CashBoxErrorState(this.errorMessage);
}