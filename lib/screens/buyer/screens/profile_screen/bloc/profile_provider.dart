import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileProvider {
  Future<ProfileModel> getProfile() async {
    log("message1");
    try {
      ApiRequester requester = ApiRequester();
      log("message2");
      Box userId= Hive.box('userIdBox');
      Response response =await requester.toGet('/register/${userId.get('user_id')}/');
      // Response response = await requester.toGet('/register/15/');
      log("${response.statusCode}");
      log("message3");
      log("Pro_id ==== ${userId.get('user_id')}");
      if (response.statusCode == 200) {
        log(response.data.toString());
        log("message4");
        ProfileModel profileModel = ProfileModel.fromJson(response.data);
        return profileModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('Profile provider error========$e');
      throw CatchException.convertException(e);
    }
  }
}
