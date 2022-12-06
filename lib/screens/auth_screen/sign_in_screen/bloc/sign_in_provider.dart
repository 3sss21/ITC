import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/sign_in_response_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignInProvider {
  Box tokenBox = Hive.box('tokenBox');
  Future<SignInResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester
          .toPost('/auth/token/token/login/', isToken: false, body: {
        'password': password,
        'email': email,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        tokenBox.put('token', response.data['auth_token']);
        SignInResponseModel responseModel =
            SignInResponseModel.fromJson(response.data);

        log(response.data.toString());

        return responseModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
