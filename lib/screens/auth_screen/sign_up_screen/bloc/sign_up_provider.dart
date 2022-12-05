import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/sign_up_response_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUpProvider {
  Box tokenBox = Hive.box('tokenBox');
  Box pincodeBox = Hive.box('pincodeBox');
  Box userIdBox = Hive.box('userIdBox');
  Future<SignUpResponseModel> createUser({
    required String email,
    required String username,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      await tokenBox.clear();
      ApiRequester requester = ApiRequester();
      log('$email,$username,$phoneNumber, $password');
      Response response = await requester.toPost('/register/', body: {
        'email': email,
        'username': username,
        'phone': phoneNumber,
        'password': password,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        SignUpResponseModel responseModel =
            SignUpResponseModel.fromJson(response.data);
        tokenBox.put('token', response.data['token']);
        pincodeBox.put('pincode', response.data['code']);
        userIdBox.put('userId', response.data['id']);
        log('User ID Sign Up ========= ${userIdBox.get('userId')}');

        log(response.data.toString());
        return responseModel;
      } else {
        throw CatchException.convertException(response.statusCode);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
