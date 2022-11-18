import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get ddMMy => DateFormat('dd/MM/y').format(this);
}
