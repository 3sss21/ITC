import 'dart:developer';

import 'package:cashback_app/helper/api_requester.dart';
import 'package:cashback_app/helper/catchException.dart';
import 'package:cashback_app/models/branch_model.dart';
import 'package:dio/dio.dart';

class BranchProvider {
  Future<List<BranchModel>> getBranch() async {
    // log("message1");
    try {
      ApiRequester requester = ApiRequester();
      // log("message2");
      Response response = await requester.toGet('/v1/branch/');
      log("${response.statusCode}");
      // log("message3");
      if (response.statusCode == 200) {
        log(response.data.toString());
        // log("message4");
        List<BranchModel> branchModelList = response.data
            .map<BranchModel>((el) => BranchModel.fromJson(el))
            .toList();
        return branchModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('Branch provider error ====== $e');
      throw CatchException.convertException(e);
    }
  }
}
