part of 'changing_data_bloc.dart';

@immutable
abstract class ChangingDataEvent {}

class PatchChangingDataEvent extends ChangingDataEvent {
  final String username;
  final String email;
  // final String phone;
  final bool isSeller;

  PatchChangingDataEvent(
    {
    required this.username,
    required this.email,
    required this.isSeller, 
    // required this.phone,
  });
}
