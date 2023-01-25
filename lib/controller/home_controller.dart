import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/services/services.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/remote/home_data.dart';

abstract class HomeController extends GetxController{
initialData();
getData();
goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();

  String? username ;
  String? id ;
  String? lang;

  HomeData homeData = HomeData(Get.find());

  //List data = [];
  List categories = [];
  List items = [];


  late StatusRequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }


@override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);

      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  goToItems(List categories, selectedCat,categoryid) {
   Get.toNamed(AppRoute.itemsScreen, arguments: {
    "categories" : categories,
     "selectedCat" : selectedCat,
     "catid" : categoryid
   });
  }
}