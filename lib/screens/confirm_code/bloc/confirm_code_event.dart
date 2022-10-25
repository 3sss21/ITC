part of 'confirm_code_bloc.dart';

@immutable
abstract class ConfirmCodeEvent {}

class PostConfirmCodeEvent extends ConfirmCodeEvent {
  final String code, email;

  PostConfirmCodeEvent({
    required this.code,
    required this.email,
  });
}
