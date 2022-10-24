import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/user_id_model.dart';
import 'package:dio/dio.dart';

class UserIdProvider {
  Future<UserIdModel> getUserId() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet('/auth/users/me/');
      if (response.statusCode == 200) {
        UserIdModel userIdModel = UserIdModel.fromMap(response.data);
        return userIdModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
