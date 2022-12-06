import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/helper/urls.dart';
import 'package:cashback_app/models/user_id_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserIdProvider {
  Box userIdBox = Hive.box('userIdBox');
  Future<UserIdModel> getUserId() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(usersMeUrl(), isToken: true);

      if (response.statusCode == 200) {
        userIdBox.put('userId', response.data['id']);
        UserIdModel userIdModel = UserIdModel.fromJson(response.data);
        return userIdModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
