// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:storeappnew/Modal_class/Rider_model.dart';
import 'package:storeappnew/Modal_class/milk_man_model.dart';
import 'package:storeappnew/Modal_class/route_model.dart';
import 'package:storeappnew/api_screens/Api_werper.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/api_screens/data_store.dart';

class MilkManController extends GetxController {
  bool isLoading = false;
  int currentindex = 0;
  MilkManModel? milkManModel;

  milkmanList({String? storeId}) async {
    isLoading = false;
    // var data = {
    //   "rid": getData.read("StoreLogin")["id"],
    // };

    try {
      var url;

      // if (riderId != null) {
      //   url = Uri.parse(
      //     AppUrl.baseUrl +
      //         AppUrl.riderpath +
      //         AppUrl.routeList +
      //         "?rider_id=${riderId}",
      //   );
      // } else {
      //   url = Uri.parse(AppUrl.baseUrl + AppUrl.riderpath + AppUrl.routeList);
      // }
      url = Uri.parse(AppUrl.path + AppUrl.milkmanList);
      var request = await http.get(url);
      var result = jsonDecode(request.body);
      if (request.statusCode == 200) {
        if (result["data"] != null || result["data"] != []) {
          milkManModel = MilkManModel.fromJson(result);
        }
      } else {
        print("API error: ${request.statusCode}");
      }
      isLoading = true;
      update();
    } catch (e) {
      //ApiWrapper.showToastMessage(e.toString());
      isLoading = true;
      update();
    }
  }
}
