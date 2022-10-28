import 'package:hive/hive.dart';

@HiveField(0)
class UserData extends HiveObject {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? qrCode;
  @HiveField(4)
  String? cashbackAll;

  UserData({
    required this.email,
    required this.username,
    required this.phone,
    required this.qrCode,
    required this.cashbackAll,
  });
}
