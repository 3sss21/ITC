part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeEvent {}

// ignore: must_be_immutable
class GetQrCodeEvent extends QrCodeEvent {
  String? email;
  String? username;
  int? phoneNumber;
  String? qrCode;
  bool? isSeller;
  double? cashbackAll;
  bool? isActive;
}
