import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/hive_models/user_data.dart';
import 'package:cashback_app/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileProvider {
  Box userId = Hive.box('userIdBox');
  Box userData = Hive.box('userDataBox');
  Future<ProfileModel> getProfile() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response =
          await requester.toGet('/register/${userId.get('userId')}/');
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        ProfileModel profileModel = ProfileModel.fromJson(response.data);

        await userData.put('email', response.data['email']);
        await userData.put('username', response.data['username']);
        await userData.put('phone', response.data['phone']);
        await userData.put('qrCode', response.data['qr_code']);
        await userData.put('cashbackAll', response.data['cashback_all']);
        await userData.put('isSeller', response.data['is_seller']);
        log("ProfileData ==== ${userData.get('phone')}");
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
