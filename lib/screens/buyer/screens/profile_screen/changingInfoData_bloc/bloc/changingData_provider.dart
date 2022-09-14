import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';

class ChangingDataProvider {
  Future patchUser({
    required String username,
    required String email,
    required bool isSeller,
    // required String phone,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response responce = await requester.toPatch('/auth/users/me/', body: {
        'username': username,
        'email': email,
        'is_seller': isSeller,
        // 'phone': phone,
      });

      if(responce.statusCode! >= 200 && responce.statusCode! < 300){
        log(responce.data.toString());
      } else {
        throw CatchException.convertException(responce);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
