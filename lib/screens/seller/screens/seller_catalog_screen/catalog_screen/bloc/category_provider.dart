import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class CategoryProvider {
  Box branchId = Hive.box('userDataBox');
  Future<CategorySellerModel> getCategory() async {
    try {
      ApiRequester requester = ApiRequester();
      log("Bdranch ID ============ ${branchId.get('branchId')}");
      Response response =
          await requester.toGet('/v1/branch/${branchId.get('branchId')}/');
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        CategorySellerModel categorySellerModel =
            CategorySellerModel.fromJson(response.data);

        return categorySellerModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
