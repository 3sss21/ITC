import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignInProvider {
  Future loginUser({
    required String phone,
    required String password,
  }) async {
    log("signin1");
    try {
      ApiRequester requester = ApiRequester();
      log("signin2");

      Response response =
          await requester.toPost('/auth/token/token/login/', body: {
        'password': password,
        'phone': phone,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
        log("signin3");

        Box tokenBox = Hive.box('tokenBox');
        log("signin4");

        tokenBox.put('token', 'Token ${response.data['auth_token']}');
        log("signin5");

        log('Token_Box ==== ${tokenBox.get('token')}');
      } else {
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
