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

abstract class ProductDetailsController extends FavoriteController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // Services & Data
  final ItemsData itemsData = ItemsData(Get.find());
  final MyServices myServices = Get.find();
  final CartData cartData = CartData(Get.find());

  // State
  late ItemsModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  int countitems = 0;

  // ✅ subitems رجّعنا
  final List<Map<String, dynamic>> subitems = const [
    {"name": "Red",    "id": 1, "active": "1"},
    {"name": "Green",  "id": 2, "active": "1"},
    {"name": "Yellow", "id": 3, "active": "1"},
    {"name": "Black",  "id": 4, "active": "1"},
  ];

  // ===== Helpers =====
  int _toInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }

  String get _userId => myServices.sharedPreferences.getString("id") ?? "";

  // ===== Lifecycle =====
  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  // ===== Logic =====
  Future<void> initialData() async {
    statusRequest = StatusRequest.loading;
    update();

    // احضر الـ ItemsModel من الـ arguments
    final args = Get.arguments;
    if (args is Map && args['itemsmodel'] is ItemsModel) {
      itemsModel = args['itemsmodel'] as ItemsModel;
    } else {
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    // جيب عدد القطع من السلة
    countitems = await getCountItems(itemsModel.itemsId ?? "");
    statusRequest = StatusRequest.success;
    update();
  }

  Future<void> addItems(String itemsid) async {
    if (_userId.isEmpty) return;

    // Optimistic UI
    countitems++;
    update();

    statusRequest = StatusRequest.none;
    final response = await cartData.addCart(_userId, itemsid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        barBlur: 10,
        backgroundColor: AppColor.white,
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.done, color: AppColor.black),
        titleText: Text("39".tr, style: const TextStyle(color: AppColor.black)),
        messageText: const Text(""),
      );
    } else {
      // rollback
      countitems = (countitems > 0) ? countitems - 1 : 0;
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future<void> delete(String itemsid) async {
    if (_userId.isEmpty || countitems <= 0) return;

    // Optimistic UI
    countitems--;
    update();

    statusRequest = StatusRequest.none;
    final response = await cartData.deleteCart(_userId, itemsid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      Get.rawSnackbar(
        duration: const Duration(seconds: 1),
        barBlur: 10,
        backgroundColor: AppColor.white,
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.done, color: AppColor.black),
        titleText: Text("39".tr, style: const TextStyle(color: AppColor.black)),
        messageText: const Text(""),
      );
    } else {
      // rollback
      countitems++;
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future<int> getCountItems(String itemsid) async {
    if (_userId.isEmpty || itemsid.isEmpty) return 0;

    statusRequest = StatusRequest.loading;
    final response = await cartData.getCountCart(_userId, itemsid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      // تحويل آمن لأي نوع
      final int count = _toInt(response['data']);
      return count;
    } else {
      statusRequest = StatusRequest.failure;
      update();
      return 0;
    }
  }

  // ===== UI Actions =====
  void add() {
    final id = itemsModel.itemsId ?? "";
    if (id.isEmpty) return;
    addItems(id);
  }

  void remove() {
    final id = itemsModel.itemsId ?? "";
    if (id.isEmpty) return;
    if (countitems > 0) {
      delete(id);
    }
  }
}