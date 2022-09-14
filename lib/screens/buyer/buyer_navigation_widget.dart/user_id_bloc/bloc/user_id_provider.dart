import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/user_id_model.dart';
import 'package:dio/dio.dart';

class UserIdProvider {
  Future<UserIdModel> getUserId() async {
    log('pro1');
    try {
      ApiRequester requester = ApiRequester();
      log('pro2');
      Response response = await requester.toGet('/auth/users/me/');
      log('${response.statusCode}');
      log('pro3');

      if (response.statusCode == 200) {
        log(response.data.toString());
        log('pro4');
        UserIdModel userIdModel = UserIdModel.fromMap(response.data);
        return userIdModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('UserId provider error ========$e');
      throw CatchException.convertException(e);
    }
  }
}
