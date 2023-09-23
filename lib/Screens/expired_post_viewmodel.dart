//import 'dart:html';

import 'package:api_integration/Screens/expired_model.dart';
import 'package:api_integration/helper/ApiBaseHelper.dart';
import 'package:api_integration/helper/erroes.dart';
import 'package:api_integration/helper/urls.dart';
import 'package:get/get.dart';

class ExpiredViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    expired();
  }

  expired_model item = expired_model();
  void expired() async {
    Map<String, dynamic> map = {};
    var res = await ApiBaseHelper().getMethod(url: Urls.BaseURL);
    if (res["error"] == false) {
      // item.add(expired_model.fromJson(res));
      item = expired_model.fromJson(res);
      print('------------------------');
      print(item);
      print("-------------------");
      // data.add(res);
      // print(data);
      print("ok");
    } else {
      Errors.generalApiError.toString();
    }
  }
}
