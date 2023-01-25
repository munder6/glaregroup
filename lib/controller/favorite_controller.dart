import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/data/remote/favorite_data.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/color.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';

class FavoriteController extends GetxController {



  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();


  Map isFavorite = {};



  setFavorite(id, val){
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid)async{

    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: Duration(seconds: 1),
            barBlur: 10,
          backgroundColor: AppColor.primaryColor,
          margin: const EdgeInsets.all(20),
          borderRadius: 20,
          snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: AppColor.white,),
            title: "39".tr,
            messageText:Text(
              "57".tr,
              style: const TextStyle(
                  color : AppColor.white,
                  fontSize: 12),
            ));
       // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();

  }

  deleteFavorite(String itemsid)async{

    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavorite(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          duration: Duration(seconds: 1),
            barBlur: 10,
            backgroundColor: AppColor.red,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: AppColor.white,),
            title: "39".tr,
            messageText:Text(
              "58".tr,
              style: const TextStyle(
                  color : AppColor.white,
                  fontSize: 12),
            )
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();


  }


}