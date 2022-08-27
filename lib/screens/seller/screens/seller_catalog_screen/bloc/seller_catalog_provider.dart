import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:dio/dio.dart';

class CatallogSellerProvider {
  Future<List<CategorySellerModel>> getCatallogSeller() async {
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester.toGet('/v1/list/category/');

      log('catalog data ==== ${response.data}');

      if (response.statusCode == 200) {
        List<CategorySellerModel> catalogSellerModelList = response.data
            .map<CategorySellerModel>((el) => CategorySellerModel.fromJson(el))
            .toList();

        print('catalogSellerModelList ====== $catalogSellerModelList');

        return catalogSellerModelList;
      }
//       }  if (response.statusCode == 200) {
// List<CharacterModel> residentsList = response.data["residents"]
//             .map<CharacterModel>((el) => CharacterModel.fromJson(el))
//             .toList();
//             return residentsList;
//       }

      else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('catalog error ====== $e');
      throw CatchException.convertException(e);
    }
  }
}
