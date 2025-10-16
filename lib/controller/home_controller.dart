import 'dart:developer';

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

abstract class HomeController extends SearchMixController {
  void initialData();
  Future<void> getData();
  void goToItems(List categories, int selectedCat, String categoryid);
  void goToPageProductDetails(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  final MyServices myServices = Get.find();
  final HomeData homeData = HomeData(Get.find());

  String? username;
  String? id;
  String? lang;

  final List categories = [];
  final List items = [];
  final List settingdata = [];

  String titlehomecard = "Loading ...";
  String bodyhomecard = "Loading ...";
  String deliverytime = "Loading ...";

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    search?.dispose();
    super.onClose();
  }

  @override
  void initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();

    final response = await homeData.getData();
    log("=============================== Controller $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response != null && response is Map && response['status'] == "success") {
        final cats = response['categories']?['data'];
        if (cats is List) {
          categories
            ..clear()
            ..addAll(cats);
        } else {
          categories.clear();
        }

        final its = response['items']?['data'] ?? response['itemsview']?['data'];
        if (its is List) {
          items
            ..clear()
            ..addAll(its);
        } else {
          items.clear();
        }

        final settings = response['setting']?['data'];
        if (settings is List && settings.isNotEmpty) {
          settingdata
            ..clear()
            ..addAll(settings);

          final first = settings.first;
          if (first is Map) {
            titlehomecard = (first['setting_titlehome'] as String?) ?? titlehomecard;
            bodyhomecard  = (first['setting_bodyhome']  as String?) ?? bodyhomecard;

            final dt = first['setting_deliverytime'] as String?;
            if (dt != null && dt.isNotEmpty) {
              deliverytime = dt;
              myServices.sharedPreferences.setString("deliverytime", dt);
            }
          }
        } else {
          settingdata.clear();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  Future<void> refreshPage() async {
    await getData();
  }

  @override
  void goToItems(List categories, int selectedCat, String categoryid) {
    Get.toNamed(
      AppRoute.itemsScreen,
      arguments: {
        "categories": categories,
        "selectedCat": selectedCat,
        "catid": categoryid,
      },
    );
  }

  @override
  void goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(
      "productdetails",
      arguments: {
        "itemsmodel": itemsModel,
      },
    );
  }
}
class SearchMixController extends GetxController {
  final HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false;

  final List<ItemsModel> listdata = [];

  void checkSearch(String val) {
    if (val.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearch = false;
      update();
      return;
    }
    update();
  }

  Future<void> onSearchItems() async {
    isSearch = true;
    update();
    await searchData();
  }

  Future<void> searchData() async {
    final query = search?.text ?? "";
    statusRequest = StatusRequest.loading;
    update();

    final response = await homeData.searchData(query);
    log("=============================== Search Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response is Map && response['status'] == "success") {
        final data = response['data'];
        if (data is List) {
          listdata
            ..clear()
            ..addAll(data.map((e) => ItemsModel.fromJson(e)).toList());
        } else {
          listdata.clear();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}

final ItemsData itemsData = ItemsData(Get.find());
