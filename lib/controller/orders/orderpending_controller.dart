import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/functions/handlingdatacontroller.dart';
import 'package:glaregroup/core/services/services.dart';
import 'package:glaregroup/data/model/ordersmodel.dart';
import 'package:glaregroup/data/remote/pendingorders_data.dart';

class OrdersPendingController extends GetxController {

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  OrderPendingData orderPindingData = OrderPendingData(Get.find());


  String printOrderType(String val) {
    if (val == "0") {
      return "78".tr;
    } else {
      return "79".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "80".tr;
    }
    if (val == "1") {
      return "81".tr;
    } else {
      return "82".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "83".tr;
    } else if (val == "1") {
      return "84".tr;
    } else if (val == "2") {
      return "85".tr;
    } else if (val == "3") {
      return "84".tr;
    }else {
      return "86".tr;
    }
  }
    getOrder() async {
      data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await orderPindingData.getData(
          myServices.sharedPreferences.getString("id")!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          List listdata = response['data'];
          data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }

  deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderPindingData.deleteData(orderid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: Text("144".tr,style: const TextStyle(color: AppColor.black),),
            messageText: Text("145".tr,style: const TextStyle(color: AppColor.black),),
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING,
            borderRadius: 30,
            backgroundColor: AppColor.white,
        );
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

    refreshOrder(){
      getOrder();
    }

    @override
    void onInit() {
      getOrder();
      super.onInit();
    }
  }