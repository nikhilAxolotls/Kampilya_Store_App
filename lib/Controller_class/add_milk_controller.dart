// ignore_for_file: file_names, avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:storeappnew/Controller_class/milk_man_history_controller.dart';
import 'package:storeappnew/Modal_class/add_milk_model.dart';
import 'package:storeappnew/api_screens/Api_werper.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/api_screens/data_store.dart';

class AddMilkController extends GetxController {
  MilkManHistoryController milkManHistoryController = Get.find();
  bool isLoading = false;
  int currentindex = 0;

  AddMilkModel? addMilkController;

  addMilk(var data) {
    isLoading = true;

    ApiWrapper.dataPost(AppUrl.addmilk, data).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        if ((val['ResponseCode'] == "200") && (val['Result'] == "true")) {
          addMilkController = AddMilkModel.fromJson(val);
          getMilkManHistory(
            data["milkman_id"],
          ); // Pass milkman_id from response

          Fluttertoast.showToast(msg: val["ResponseMsg"]);
          // ApiWrapper.showToastMessage(val["ResponseMsg"]);
        } else {
          //ApiWrapper.showToastMessage(val["ResponseMsg"]);
          Fluttertoast.showToast(msg: val["ResponseMsg"]);
          getMilkManHistory(data["milkman_id"]);
        }
        isLoading = false;
        update();
      }
    });
  }

  Future<void> getMilkManHistory(String milkmanId) async {
    await milkManHistoryController.getMilkManHistory(milkmanId: milkmanId);
  }
}



// {
//   "store_id": "2",
//   "milkman_id": "1",
//   "supply_date": "2025-12-20",
//   "supply_time": "6:55 AM",
//   "milk_type": "cow",
//   "quantity_litre": "15.75",
//   "fat": "4.2",
//   "snf": "8.8",
//   "quality": "Excellent"	
// }