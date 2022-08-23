import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/category_seller_model.dart';
import 'package:dio/dio.dart';

class CatallogBuyerProvider {
  Future<List<CategorySellerModel>> getCatallogBuyer() async {
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester.toGet('v1/create/category/');

      if (response.statusCode == 200) {
        List<CategorySellerModel> catalogBuyerModelList = response.data
            .map<CategorySellerModel>((el) => CategorySellerModel.fromJson(el))
            .toList();
        return catalogBuyerModelList;
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
      throw CatchException.convertException(e);
    }
  }
}
