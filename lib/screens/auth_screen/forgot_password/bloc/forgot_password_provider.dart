import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:dio/dio.dart';

class ForgotPassProvider {
  Future resetPassword({
    required String email,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toPost('auth/users/reset_password', body: {
        "email": email,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
