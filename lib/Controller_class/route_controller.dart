// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:storeappnew/Modal_class/Rider_model.dart';
import 'package:storeappnew/Modal_class/route_model.dart';
import 'package:storeappnew/api_screens/Api_werper.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/api_screens/data_store.dart';

class RouteController extends GetxController {
  bool isLoading = false;
  int currentindex = 0;

  List<String> ridertitle = [];
  RouteInfo? routeInfo;

  routeList() async {
    isLoading = false;
    // var data = {
    //   "rid": getData.read("StoreLogin")["id"],
    // };

    try {
      var url = Uri.parse(AppUrl.baseUrl + AppUrl.riderpath + AppUrl.routeList);
      var request = await http.get(url);
      // var response = jsonDecode(request.body);
      var result = jsonDecode(request.body);
      if (request.statusCode == 200) {
        print("Parsed result: " + result.toString());

        if (result["AssignedRoutes"] != null ||
            result["AssignedRoutes"] != []) {
          routeInfo = RouteInfo.fromJson(result);

          print("Route Info: " + routeInfo.toString());
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
