import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';

class QrCodeProvider {
  Future getQrCode({
    String? email,
    String? username,
    int? phoneNumber,
    String? password,
    String? qrCode,
    bool? isSeller,
    double? cashbackAll,
    bool? isActive,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/register/', body: {
        'email': email,
        'username': username,
        'phone': phoneNumber,
        'password': password,
        'qr_code': qrCode,
        'is_seller': isSeller,
        'cashback_all' : cashbackAll,
        'is_active' : isActive
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
      } else {
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
