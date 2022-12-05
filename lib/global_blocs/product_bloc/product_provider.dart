import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductProvider {
  Future<List<ProductModel>> getProduct(int categoryId) async {
    Map<String, int> queryParam = {"category__id": categoryId};
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester.toGet(
        '/v1/products/product/',
        queryParam: queryParam,
      );

      if (response.statusCode == 200) {
        List<ProductModel> listOfProduct = response.data
            .map<ProductModel>((el) => ProductModel.fromJson(el))
            .toList();

        return listOfProduct;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
