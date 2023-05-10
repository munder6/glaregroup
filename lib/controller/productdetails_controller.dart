import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/favorite_controller.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/data/remote/itemsdata.dart';

import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/model/itemsmodel.dart';
import '../data/remote/cart_data.dart';

abstract class ProductDetailsController extends FavoriteController {

}

class ProductDetailsControllerImp extends ProductDetailsController {

  ItemsData itemsData = ItemsData(Get.find());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countitems = 0 ;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());




  initialData() async {
    statusRequest = StatusRequest.loading;
   itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
   statusRequest = StatusRequest.success;
   update();

  }

  addItems(String itemsid)async{
    update();
    statusRequest = StatusRequest.none;
    var response = await cartData.addCart( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: const Duration(seconds: 1),
            barBlur: 10,
            backgroundColor: AppColor.white,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.done, color: AppColor.black,),
            titleText: Text("39".tr, style: const TextStyle(color: AppColor.black),),
            messageText:Text(
              "76".tr,
              style: const TextStyle(
                  color : AppColor.black,
                  fontSize: 12),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();

  }

  delete(String itemsid)async{

    statusRequest = StatusRequest.none;
    update();
    var response = await cartData.deleteCart( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: Duration(seconds: 1),
            barBlur: 10,
            backgroundColor: AppColor.white,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.done, color: AppColor.black,),
            titleText: Text("39".tr, style: TextStyle(color: AppColor.black),),
            messageText:Text(
              "77".tr,
              style: const TextStyle(
                  color : AppColor.black,
                  fontSize: 12),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();

  }

  getCountItems(String itemsid)async{
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart( myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0 ;
        countitems = int.parse(response['data']);
        print("=============================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }


  List subitems = [
    {"name" : "Red", "id" : 1, "active" : "1",},
    {"name" : "Green", "id" : 2, "active" : "1",},
    {"name" : "Yellow", "id" : 3, "active" : "1",},
    {"name" : "Black", "id" : 4, "active" : "1",}
  ];

  add(){
  addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove(){
    if(countitems > 0){
     delete(itemsModel.itemsId!);
      countitems --;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}