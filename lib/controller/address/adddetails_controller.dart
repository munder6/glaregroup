
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/functions/handlingdatacontroller.dart';
import 'package:glaregroup/core/services/services.dart';
import 'package:glaregroup/data/remote/address_data.dart';

class AddressAddDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: Duration(seconds: 1),
            barBlur: 10,
            backgroundColor: AppColor.primaryColor,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.done, color: AppColor.white,),
            title: "39".tr,
            messageText:Text(
              "152".tr,
              style: const TextStyle(
                  color : AppColor.white,
                  fontSize: 12),
            ));
        Get.offAllNamed(AppRoute.homeScreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}