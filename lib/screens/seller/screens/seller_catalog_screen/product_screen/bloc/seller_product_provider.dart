import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:cashback_app/models/seller_catalog.dart';
import 'package:dio/dio.dart';

class ProductSellerProvider {
  Future<List<CatalogSeller>> getProductSeller() async {
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester.toGet('/product');

      log('catalog data111 ==== ${response.data}');

      if (response.statusCode == 200) {
        List<CatalogSeller> catalogSellerModelList = response.data
            .map<CatalogSeller>((el) => CatalogSeller.fromJson(el))
            .toList();

        print('catalogSellerModelList1111 ====== $catalogSellerModelList');

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
      print('catalog error1111 ====== $e');
      throw CatchException.convertException(e);
    }
  }
}
