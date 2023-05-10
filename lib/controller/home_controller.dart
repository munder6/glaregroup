import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/services/services.dart';
import 'package:glaregroup/data/model/itemsmodel.dart';
import 'package:glaregroup/data/remote/itemsdata.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/remote/home_data.dart';

abstract class HomeController extends SearchMixController{
initialData();
goToPageProductDetails(itemsModel);
getData();
goToItems(List categories, int selectedCat, String categoryid);
}

ItemsData itemsData = ItemsData(Get.find());

class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();
  String? username ;
  String? id ;
  String? lang;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List settingdata = [];
  String titlehomecard = "Loading ...";
  String bodyhomecard ="Loading ..." ;
  String deliverytime = "Loading ..." ;



  @override
  initialData() {

    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }


@override
  void onInit() {
  search = TextEditingController();
  getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
      print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingdata.addAll(response['setting']['data']);
        titlehomecard = settingdata[0]['setting_titlehome'];
        bodyhomecard = settingdata[0]['setting_bodyhome'];
        deliverytime = settingdata[0]['setting_deliverytime'];
        myServices.sharedPreferences.setString("deliverytime", deliverytime);

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

  @override
  goToPageProductDetails(itemsModel){
    Get.toNamed("productdetails", arguments: {
      "itemsmodel" : itemsModel,
    });
  }
}

class SearchMixController extends GetxController {

  List<ItemsModel> listdata = [];
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false;


  checkSearch (val){
    if(val == ""){
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems (){
    searchData();
    isSearch = true;
    update();
  }


  searchData() async {

    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List resposedata = response['data'];
        listdata.addAll(resposedata.map((e) => ItemsModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }
}

