part of 'confirm_code_bloc.dart';

@immutable
abstract class ConfirmCodeEvent {}


class GetConfirmCodeEvent extends ConfirmCodeEvent {

  final String code;

  GetConfirmCodeEvent({

    required this.code,
  });
}