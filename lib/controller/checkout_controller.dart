import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/class/statusrequest.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/functions/handlingdatacontroller.dart';
import 'package:glaregroup/core/services/services.dart';
import 'package:glaregroup/data/model/addressmodel.dart';
import 'package:glaregroup/data/remote/address_data.dart';
import 'package:glaregroup/data/remote/checkout_data.dart';

class CheckoutController extends GetxController{

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();


  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";



  late String coupondiscount;
  late String couponid;
  late String priceorders;


  List<AddressModel> dataaddress = [];

  StatusRequest statusRequest = StatusRequest.none;


  choosePaymentMethod(String val){
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val){
    deliveryType = val ;
    update();
  }

  chooseShippingAddress(String val){
    addressId = val;
    update();
  }

  getShippingAddress()async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      List listdata = response['data'];
      dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      addressId = dataaddress[0].addressId.toString();
      } else {
        //statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }


  checkout()async{

    if(paymentMethod == null) return Get.snackbar("134".tr, "135".tr);
    if(deliveryType == null) return Get.snackbar("134".tr, "136".tr);
    if(dataaddress.isEmpty) return Get.snackbar("134".tr, "151".tr);
    statusRequest = StatusRequest.loading;
    update();


    Map data = {
      "usersid" : myServices.sharedPreferences.getString('id'),
      "addressid" : addressId.toString(),
      "pricedelivery" : "10",
      "ordersprice" : priceorders.toString(),
      "couponid" : couponid,
      "coupondiscount" : coupondiscount.toString(),
      "paymentmethod" : paymentMethod.toString(),
      "orderstype" : deliveryType.toString(),

    };

    var response = await checkoutData.checkout(data);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("success");
        Get.rawSnackbar(
            duration: Duration(seconds: 1),
            barBlur: 10,
            backgroundColor: AppColor.green,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(Icons.done, color: AppColor.white,),
            title: "39".tr,
            messageText:Text(
              "74".tr,
              style: const TextStyle(
                  color : AppColor.white,
                  fontSize: 12),
            ));
        Get.offAllNamed(AppRoute.homeScreen);

      } else {
        statusRequest = StatusRequest.none ;
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
              "75".tr,
              style: const TextStyle(
                  color : AppColor.white,
                  fontSize: 12),
            ));

      }
    }
    update();
  }


  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    priceorders = Get.arguments['priceorder'];
    getShippingAddress();
    super.onInit();
  }
}